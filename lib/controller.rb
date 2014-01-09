module Poseidon
  class Controller
    attr_reader :request
    attr_reader :response
    attr_accessor :params
    attr_accessor :flash
    attr_accessor :meth
    attr_accessor :has_redirect
    attr_accessor :controller
    

    def initialize request, meth
      @request = request
      @params =  Rack::Utils.parse_nested_query(request.body.read).deep_symbolize_keys
      @flash = []
      @response = {body: "empty", status: 200, header: {} }
      @meth = meth
      @controller = self
      # TODO: implement callbacks 
      # self.class.call_before_all_methods
    end

    # redirect_to :controller => "post", :action => "show", :id => 1
    def redirect_to options = {}
      @has_redirect = options
    end
        
    def response_status status
      response[:status] = status
    end    


    # TODO: implement sessions 
    # def self.helper_method(*meths)
    #         meths.flatten!
    #         meths.each do |meth|
    #           class_eval <<-ruby_eval, __FILE__, __LINE__ + 1
    #             def #{meth}(*args, &blk)                               # def current_user(*args, &blk)
    #               controller.send(%(#{meth}), *args, &blk)             #   controller.send(:current_user, *args, &blk)
    #             end                                                    # end
    #           ruby_eval
    #         end
    #       end          
          
          
    # def build_response
    #   cont = self.class.name.gsub("Controller", "").downcase
    #   meth = caller[0][/`([^']*)'/, 1]
    #   view = Tilt.new(Application.root + "/views/#{cont}/#{meth}.html.erb").render(self)
    #   response = Application::Response.new()
    #   response.write(view)
    #   response.finish
    # end
    # 
    # def self.call_before_all_methods
    #   class_eval <<-END
    #   alias :original_index :index
    #   def malakia
    #     warn "kotopoulo?????"
    #     original_index
    #     build_response
    #   end
    #    # remove_method :original_index
    #   # class.send :remove_method, :original_index
    #   END
    # end
    # # private_class_method :call_before_all_methods
    
    def class_to_model_name
      self.class.name.gsub("Controller", "").downcase
    end
    
    # Last called function
    # returns the status code/headers/body of the request
    def generate_html_and_build_response!
      controller = self.class_to_model_name
      response_body =  Poseidon::View.new.render(controller, meth, self)
      response.merge!(body: response_body)
      return response
    end
  end
end
