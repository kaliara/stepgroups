require 'test_helper'

class DocumentSectionsControllerTest < ActionController::TestCase
  setup do
    @document_section = document_sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:document_sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create document_section" do
    assert_difference('DocumentSection.count') do
      post :create, document_section: @document_section.attributes
    end

    assert_redirected_to document_section_path(assigns(:document_section))
  end

  test "should show document_section" do
    get :show, id: @document_section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @document_section
    assert_response :success
  end

  test "should update document_section" do
    put :update, id: @document_section, document_section: @document_section.attributes
    assert_redirected_to document_section_path(assigns(:document_section))
  end

  test "should destroy document_section" do
    assert_difference('DocumentSection.count', -1) do
      delete :destroy, id: @document_section
    end

    assert_redirected_to document_sections_path
  end
end
