module Poseidon
  class Router

    def initialize env
      @default_routes = "post/index"
      @env = env
    end
    
    def route
      request = Poseidon::Request.new(@env)
      @path = request.path_info
      controller, method, params =  parse_route
      Poseidon::Dispatcher.new(controller, method, params, request).dispatch!
    end
    
    def is_root?
      @path == "/" 
    end
    
    def parse_route
      return @default_routes.split("/") if is_root?
      @path.split("/").drop(1)
    end
    
  end


# class Router
#   attr_reader :routes
# 
#   def initialize
#     @routes = Hash.new { |hash, key| hash[key] = [] }
#   end
# 
#   def config &block
#     instance_eval &block
#   end
# 
#   def get path, options = {}
#     @routes[:get] << [path, parse_to(options[:to])]
#   end
# 
#   def route_for env
#     path   = env["PATH_INFO"]
#     method = env["REQUEST_METHOD"].downcase.to_sym
#     route_array = routes[method].detect do |route|
#       case route.first
#       when String
#         path == route.first
#       when Regexp
#         path =~ route.first
#       end
#     end
#     return Route.new(route_array) if route_array
#     return nil #No route matched
#   end
# 
#   private
#   def parse_to to_string
#     klass, method = to_string.split("#")
#     {:klass => klass.capitalize, :method => method}
#   end
# end

end