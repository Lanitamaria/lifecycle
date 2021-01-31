require 'test_helper'

class CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get assignments:references" do
    get category_assignments:references_url
    assert_response :success
  end

end
