module Poseidon
  class View 

    def render controller_name,method,controller_instance
      Tilt.new(Poseidon.root + '/views/application.html.erb').render do
          Tilt.new(Poseidon.root + "/views/#{controller_name}/#{method}.html.erb").render(controller_instance)
        end
    end
    
    
    def render_partial file, locals, object
      Tilt.new(Poseidon.root + file).render(object, locals)
    end 
    
  end
end


