$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pg_connection_counter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pg_connection_counter"
  s.version     = PgConnectionCounter::VERSION
  s.authors     = ["Neeraj Singh"]
  s.email       = ["neeraj@BigBinary.com"]
  s.homepage    = "http://github.com/bigbinary"
  s.summary     = "Displays number of connections opened in the database."
  s.description = "Displays number of connections opened in the database."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.8"

  s.add_development_dependency "sqlite3"
end
