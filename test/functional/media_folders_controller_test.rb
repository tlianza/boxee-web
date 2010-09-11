require 'test_helper'

class MediaFoldersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:media_folders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create media_folder" do
    assert_difference('MediaFolder.count') do
      post :create, :media_folder => { }
    end

    assert_redirected_to media_folder_path(assigns(:media_folder))
  end

  test "should show media_folder" do
    get :show, :id => media_folders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => media_folders(:one).to_param
    assert_response :success
  end

  test "should update media_folder" do
    put :update, :id => media_folders(:one).to_param, :media_folder => { }
    assert_redirected_to media_folder_path(assigns(:media_folder))
  end

  test "should destroy media_folder" do
    assert_difference('MediaFolder.count', -1) do
      delete :destroy, :id => media_folders(:one).to_param
    end

    assert_redirected_to media_folders_path
  end
end
