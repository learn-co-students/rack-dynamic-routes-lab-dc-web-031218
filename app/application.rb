class Application

  @@items = []


  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      search_term = req.path.split(/items/).last
      search_term = search_term[1..-1]
      item = @@items.find{|i| i.name == search_term}

      if @@items.include?(item)
        resp.write "The price is #{item.price}"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  # def handle_search(search_term)
  #   if @@items.include?(search_term)
  #     return "#{search_term} is one of our items"
  #   else
  #     return "Couldn't find #{search_term}"
  #   end
  # end
end
