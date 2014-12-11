Rails.application.routes.draw do

  mount PgConnectionCounter::Engine => "/pg_connection_counter"
end
