module Poseidon
  module Middlewares
    extend self
    attr_accessor :klass_configs
    attr_accessor :klass_collection
    attr_accessor :mounted_engines
    @mounted_engines = []
    
    # Add Middleware 
    # Application::Middlewares.klass_collection << Rack::ShowExceptions
    @klass_collection = [
    Rack::CommonLogger, 
    Rack::Reloader, 
    Rack::Head,
    Rack::ShowExceptions, 
    BetterErrors::Middleware
    ]
    
    # Config all classes
    @klass_configs = [
      BetterErrors.application_root = __dir__ 
    ]
    
    # Mount Engines
    @mounted_engines << {
      slug: "/version", 
      proc: Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["version 0.1"]] }
    }
    
  end
end