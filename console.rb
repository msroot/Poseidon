require 'active_record'
require 'sqlite3'

ActiveRecord::Base.configurations = YAML::load(IO.read('db/config.yml'))
ActiveRecord::Base.establish_connection("development")
Dir['models/**/*.rb'].each{|model| require File.expand_path("../#{model}", __FILE__)}
