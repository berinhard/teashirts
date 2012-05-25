require 'minitest/spec'
require 'minitest/autorun'

require 'webmock/minitest'

require './lib/camiseteria_catalog'


describe CamiseteriaCatalog do
  before do
    stub_camiseteria_request
  end

  it "returns all shirts" do
    shirts = CamiseteriaCatalog.new.shirts()

    shirts.size.must_equal(93)

    shirts.must_include({
      "tshirt_url" => "http://camiseteria.com/product.aspx?pid=1598",
      "image_url" => "http://assets3.camiseteria.com/images/products/camisetas/1598_tam4.gif",
      "name" => "Joker"
    })
  end

  it "returns the first N shirts" do
    shirts = CamiseteriaCatalog.new.shirts(5)

    shirts.size.must_equal(5)
  end
end


def stub_camiseteria_request
  File.open(File.expand_path(File.dirname(__FILE__) + '/../helper/camiseteria.json'), 'r') do |f|
      stub_request(:get, "http://dl.dropbox.com/u/79616445/camiseteria.json").
          to_return(:body => f)
  end
end