require "./settings"


get "/" do
  tshirts = CamiseteriaCatalog.new.shirts()

  erb :index, :locals => {
    :tshirts => tshirts.first(5)
  }
end