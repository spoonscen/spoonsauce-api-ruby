require './app'
require 'test/unit'
require "rack/test"

class SpoonsauceTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index_page_get
    get "/"
    assert_send([last_response.body, :include?, "<!doctype html>"])  
    assert last_response.ok?
  end

  def test_peppers_page_get
    get "/api/peppers"
    assert_send([last_response.body, :include?, "data"])  
    assert last_response.ok?
  end

end