require "./settings"

get "/" do
  file_path = "http://dl.dropbox.com/u/79616445/camiseteria.json"
  content = open(file_path).read()
  tshirts = JSON::parse(content)

  erb :index, :locals => {:tshirts => tshirts.first(5)}
end