# PgConnectionCounter

Displays the number of connections opened in the database.

#### Usage

```
gem 'pg_connection_counter'
```

This gem provides a rake task.

```
rake log_pg_connection_counter
```

If you want more fine grained control then use like this.

```
PgConnectionCounter::Counter.new.display
```
