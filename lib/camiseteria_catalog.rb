require "open-uri"
require "json"

# [
#   {
#     tshirt_url, image_url, name
#   }, ...
# ]
class CamiseteriaCatalog
  @@catalog_url = 'http://dl.dropbox.com/u/79616445/camiseteria.json'

  def shirts(limit=nil)
    content = open(@@catalog_url).read()
    results = JSON::parse(content)

    return results.first(limit) if limit
    results
  end
end

class ChicoReiCatalog
  @@catalog_url = 'http://dl.dropbox.com/u/79616445/chico_rei.json'

  def shirts(limit=nil)
    content = open(@@catalog_url).read()
    results = JSON::parse(content)

    return results.first(limit) if limit
    results
  end
end
