require 'test_helper'

class QualificationControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
