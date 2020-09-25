require 'test_helper'

class MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get info" do
    get mypage_info_url
    assert_response :success
  end

  test "should get following" do
    get mypage_following_url
    assert_response :success
  end

  test "should get followers" do
    get mypage_followers_url
    assert_response :success
  end

  test "should get questions" do
    get mypage_questions_url
    assert_response :success
  end

  test "should get favorites" do
    get mypage_favorites_url
    assert_response :success
  end

  test "should get messages" do
    get mypage_messages_url
    assert_response :success
  end

  test "should get edit" do
    get mypage_edit_url
    assert_response :success
  end

  test "should get update" do
    get mypage_update_url
    assert_response :success
  end

end
