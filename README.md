# PgConnectionCounter

Displays the number of connections opened in the database.

#### Usage

```
gem 'pg_connection_counter'
```

This gem provides a rake task. The rake task can be run on hourly basis and log the connection status.

```
rake log_pg_connection_counter
```

If you want more fine grained control then use like this. In one project we put a `before_action` call to display the connection status using the method described below.

```
PgConnectionCounter::Counter.new.display
```
