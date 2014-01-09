require 'rubygems'
require 'rack/handler'
require 'erb'
require 'active_record'
require 'sqlite3'
require 'tilt'
require 'stringio'
require "better_errors"
require "binding_of_caller"
require 'logger'



ActiveRecord::Base.configurations = YAML::load(IO.read('db/config.yml'))
ActiveRecord::Base.establish_connection("development")

["lib", "models", "controllers"].each do |path|
  Dir["#{path}/**/*.rb"].each{|lib| require File.expand_path("../#{lib}", __FILE__)}  
end

Poseidon.root =  File.expand_path File.dirname(__FILE__) 

module Poseidon
  class Runner
    def self.call(env)
      Poseidon::Router.new(env).route
    end
  end
end
