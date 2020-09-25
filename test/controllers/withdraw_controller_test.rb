require 'test_helper'

class WithdrawControllerTest < ActionDispatch::IntegrationTest
  test "should get confirm" do
    get withdraw_confirm_url
    assert_response :success
  end

  test "should get update" do
    get withdraw_update_url
    assert_response :success
  end

end
