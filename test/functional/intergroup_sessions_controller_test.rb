require 'test_helper'

class IntergroupSessionsControllerTest < ActionController::TestCase
  setup do
    @intergroup_session = intergroup_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:intergroup_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create intergroup_session" do
    assert_difference('IntergroupSession.count') do
      post :create, intergroup_session: @intergroup_session.attributes
    end

    assert_redirected_to intergroup_session_path(assigns(:intergroup_session))
  end

  test "should show intergroup_session" do
    get :show, id: @intergroup_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @intergroup_session
    assert_response :success
  end

  test "should update intergroup_session" do
    put :update, id: @intergroup_session, intergroup_session: @intergroup_session.attributes
    assert_redirected_to intergroup_session_path(assigns(:intergroup_session))
  end

  test "should destroy intergroup_session" do
    assert_difference('IntergroupSession.count', -1) do
      delete :destroy, id: @intergroup_session
    end

    assert_redirected_to intergroup_sessions_path
  end
end
