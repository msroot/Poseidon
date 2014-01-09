# link_to "Add new Post", @posts.last, "new" 
# link_to "Show Post", @posts.last, "new", class: "btn btn-default"
def link_to(body, object = nil, action = "show", html_options = {})
  case action
  when "new" ,"index"
    "<a href = '/#{object.class.name.downcase}/#{action}' class='#{html_options[:class]}' title='#{html_options[:title]}'>#{body}</a>"
    
  when "show","edit", "destroy"
    "<a href='/#{object.class.name.downcase}/#{action}/#{object.id}' class='#{html_options[:class]}' title='#{html_options[:title]}' >#{body}</a>"

  else
    "Not implemented yet"
  end
    
end

# url_for :controller => "post", :action => "index"
# "/post/index"
# url_for :controller => "post", :action => "show", :id => 1
# "/post/show/1"
def url_for options = {}
  return "/#{options[:controller].downcase}/#{options[:action]}/#{options[:id]}" if options[:id].present?
  "/#{options[:controller.downcase]}/#{options[:action]}"
end

def render_partial file, locals = {}, object = nil 
  Poseidon::View.new.render_partial(file, locals, object)
end

def escape_html string
  Rack::Utils.escape_html(string)
end