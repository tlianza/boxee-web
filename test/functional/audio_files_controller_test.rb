require 'test_helper'

class AudioFilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audio_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audio_file" do
    assert_difference('AudioFile.count') do
      post :create, :audio_file => { }
    end

    assert_redirected_to audio_file_path(assigns(:audio_file))
  end

  test "should show audio_file" do
    get :show, :id => audio_files(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => audio_files(:one).to_param
    assert_response :success
  end

  test "should update audio_file" do
    put :update, :id => audio_files(:one).to_param, :audio_file => { }
    assert_redirected_to audio_file_path(assigns(:audio_file))
  end

  test "should destroy audio_file" do
    assert_difference('AudioFile.count', -1) do
      delete :destroy, :id => audio_files(:one).to_param
    end

    assert_redirected_to audio_files_path
  end
end
