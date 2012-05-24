require "open-uri"
require "json"

# [
#   {
#     tshirt_url, image_url, name
#   }, ...
# ]
class CamiseteriaCatalog
  @@catalog_url = 'http://dl.dropbox.com/u/79616445/camiseteria.json'

  def shirts
    content = open(@@catalog_url).read()
    results = JSON::parse(content)

    results
  end
end