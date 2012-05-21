require "sinatra"
require "json"
require "open-uri"

configure(:development) do |c|
  require "sinatra/reloader"
  c.also_reload "*.rb"
end

helpers do
   def title
      @title || "TeaShirts"
   end
end

get "/" do
    file_path = "http://dl.dropbox.com/u/79616445/camiseteria.json"
    content = open(file_path).read()
    tshirts = JSON::parse(content)
    erb :index, :locals => {:tshirts => tshirts.first(3)}
end
