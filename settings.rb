require "sinatra"
require 'sinatra/simple-navigation'

require "./helpers"

require "./lib/camiseteria_catalog"

configure(:development) do |c|
  require "sinatra/reloader"
  c.also_reload "*.rb"
end

use Rack::Deflater

CACHE_DURATION = 60 * 24

set :static_cache_control, [:public, :max_age => CACHE_DURATION]

before do
  response.headers['Cache-Control'] = 'public, max-age=' + CACHE_DURATION.to_s
end