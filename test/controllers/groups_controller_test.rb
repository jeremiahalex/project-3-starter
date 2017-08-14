require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest

  test "should get show_current_user" do
    get groups_show_current_user_url
    assert_response :success
  end


  # test "the truth" do
  #   assert true
  # end

end
