module PgConnectionCounter
  class Counter
    attr_reader :logger

    def initialize
      @logger = []
    end

    def display
      log "=="*30
      log "Number of connections allowed by Active Record per application: #{active_record_limit_of_number_of_db_connections_per_application}"
      log "Number of connections to the database: #{number_of_connections_to_db} "
      pg_stat_activities.each do |record|
        log "pid: #{record['pid']}, state: #{record['state']}"
        log "application_name: #{record['application_name']}"
        log "query: #{record['query']}"
        log ""
      end
      log "=="*30

      logger.each do |record|
        Rails.logger.info record
      end
    end

    private

    # https://github.com/rails/rails/blob/master/activerecord/lib/active_record/connection_adapters/abstract/connection_pool.rb
    def active_record_limit_of_number_of_db_connections_per_application
      ActiveRecord::Base.connection_pool.size
    end

    def pg_stat_activities
      execute_query query_for_pg_stat_activities
    end

    def query_for_pg_stat_activities
      "SELECT pid, state, usename, application_name, query FROM pg_stat_activity where pid <> pg_backend_pid()  and usename = current_user;"
    end

    def number_of_connections_to_db
      result = execute_query query_for_number_of_connections_to_db
      result.first["count"]
    end

    def query_for_number_of_connections_to_db
      'select count(*) from pg_stat_activity where pid <> pg_backend_pid()  and usename = current_user;'
    end

    def execute_query query
      ActiveRecord::Base.connection.execute(query).to_a
    end

    def log msg
      self.logger << msg
    end

  end
end
