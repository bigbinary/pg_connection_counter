 desc "Log pg connection counter"
 task log_pg_connection_counter: :environment do
   PgConnectionCounter::Counter.new.display
 end
