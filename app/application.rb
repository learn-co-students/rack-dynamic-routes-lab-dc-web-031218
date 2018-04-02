class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match(/items/)
    item = req.path.split("/items/").last
    object = @@items.find{|x|x.name == item}
    object ? resp.write(object.price) : resp.status = "400"; resp.write "Item not found"
  else
    resp.status = "404"
    resp.write "Route not found"
  end
  resp.finish
end

end
