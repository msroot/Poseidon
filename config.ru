# Rack::Handler::WEBrick = Rack::Handler.get(:puma)
# Rack::Server.start :app => Application::Runner

# require 'bundler' 
# Bundler.require

# rackup config.ru
# http://hawkins.io/2012/07/rack_from_the_beginning/

# Example apps
# http://isotope11.com/blog/build-your-own-web-framework-with-rack-and-ruby-part-2
# https://github.com/joesteele/ruby-on-rack

# require 'rubygems'
# require 'bundler'
# Bundler.require
# Dotenv.load


require "./boot.rb"

runner = Rack::Builder.new{ 
  Poseidon::Middlewares.klass_collection.map{|klass|
    use klass
    warn "=> #{klass.inspect} loaded!"
  }

  Poseidon::Middlewares.klass_configs.map{|config|
    config
    warn "=> #{config.inspect} configured!"
  }

  Poseidon::Middlewares.mounted_engines.each{|engine|
    map engine[:slug] do
      run engine[:proc]
      warn "=> #{engine[:slug]} mounted!"
    end
    
  }
  # Using Sprockets
  # map '/assets' do
  #   environment = Sprockets::Environment.new
  #   environment.append_path 'assets/javascripts'
  #   run environment
  # end

  # Serve Static files
  use Rack::Static, urls: ['/js', '/css', '/fonts'], root: 'public'
  
  # Use a loger
  # logfile = ::File.join(::File.dirname(__FILE__),'log','app.log')
  # class ::Logger; alias_method :write, :<<; end
  # logger  = ::Logger.new(logfile,'weekly')
  # use Rack::CommonLogger, logger
  
  map '/' do
    run Poseidon::Runner
  end
  
    
}.to_app

Rack::Handler::Thin.run runner
