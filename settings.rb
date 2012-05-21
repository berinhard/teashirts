require "open-uri"
require "json"

require "sinatra"
require "dalli" if production?

require "./helpers"

configure(:development) do |c|
  require "sinatra/reloader"
  c.also_reload "*.rb"
end

set :static_cache_control, [:public, :max_age => 600]
set :cache, (production? ? Dalli::Client.new : nil)

before do
  response.headers['Cache-Control'] = 'public, max-age=600' # 10 in 10 minutes
end


