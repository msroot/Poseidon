# http://brainspl.at/request_response.pdf
module Poseidon
  class Dispatcher
    attr_accessor :controller_name 
    attr_accessor :method
    attr_accessor :params
    attr_accessor :request
    
    def initialize controller_name, meth, params, request
      @controller_name, @method, @params, @request = controller_name, meth, params, request
    end
    
    def dispatch!
      controller = Object.const_get(controller_name.capitalize + "Controller").new(request, method)
      controller.params.merge!(:id => params) unless params.blank?
      controller.send(method)
      handle_response(controller)
    end
    
    def handle_response controller
      if !controller.has_redirect.blank?
        
        response = Poseidon::Response.new
        url = url_for(controller.has_redirect)
        response.redirect(url)
        response.finish
      else
        controller_response = controller.generate_html_and_build_response!
        rack_response = Poseidon::Response.new(
        [],
        controller_response[:status],
        controller_response[:header]
        )
        
        rack_response.write(controller_response[:body])
        rack_response.finish
      end
   
    end
    
end
end
