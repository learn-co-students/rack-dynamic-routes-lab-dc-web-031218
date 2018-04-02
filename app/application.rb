class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_search = req.path.split("/items/").last

      if Item.all.find{|item| item.name == item_search}
        item = Item.all.find{|item| item.name == item_search}
        resp.write item.price
        resp
      else
        resp.write "Item not found"
        resp.status = 400
        resp
      end
    else
      resp.write "Route not found"
      resp.status = 404
      resp
    end
  end
end
