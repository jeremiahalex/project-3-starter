require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get restaurants_index_url
    assert_response :success
  end

end
