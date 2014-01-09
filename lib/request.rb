# https://github.com/rack/rack/blob/master/lib/rack/request.rb
module Poseidon
  class Request < Rack::Request
     # req = Rack::Request.new(Rack::MockRequest.env_for("http://example.com:8080/"))
     # req = Rack::Request.new(Rack::MockRequest.env_for("/?foo=bar&quux=bla"))
end
end