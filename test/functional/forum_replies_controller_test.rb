require 'test_helper'

class ForumRepliesControllerTest < ActionController::TestCase
  setup do
    @forum_reply = forum_replies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forum_replies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum_reply" do
    assert_difference('ForumReply.count') do
      post :create, forum_reply: @forum_reply.attributes
    end

    assert_redirected_to forum_reply_path(assigns(:forum_reply))
  end

  test "should show forum_reply" do
    get :show, id: @forum_reply
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forum_reply
    assert_response :success
  end

  test "should update forum_reply" do
    put :update, id: @forum_reply, forum_reply: @forum_reply.attributes
    assert_redirected_to forum_reply_path(assigns(:forum_reply))
  end

  test "should destroy forum_reply" do
    assert_difference('ForumReply.count', -1) do
      delete :destroy, id: @forum_reply
    end

    assert_redirected_to forum_replies_path
  end
end
