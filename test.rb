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
    assert_equal "Cory's simple API using Ruby and Mongo", last_response.body
    assert last_response.ok?
  end

  def test_peppers_page_get
    delete "api/peppers"
    get "/api/peppers"
    assert_equal "You have no peppers in the database", last_response.body
    assert last_response.ok?
    post "api/peppers"
  end

end