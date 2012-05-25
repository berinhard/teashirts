require "./settings"


get "/" do
  tshirts = CamiseteriaCatalog.new.shirts(5)

  erb :index, :locals => {
    :tshirts => tshirts
  }
end

get "/camiseteria" do
  tshirts = CamiseteriaCatalog.new.shirts()

  erb :'store/camiseteria', :locals => {
    :tshirts => tshirts
  }
end