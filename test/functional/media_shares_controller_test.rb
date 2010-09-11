require 'test_helper'

class MediaSharesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:media_shares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create media_share" do
    assert_difference('MediaShare.count') do
      post :create, :media_share => { }
    end

    assert_redirected_to media_share_path(assigns(:media_share))
  end

  test "should show media_share" do
    get :show, :id => media_shares(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => media_shares(:one).to_param
    assert_response :success
  end

  test "should update media_share" do
    put :update, :id => media_shares(:one).to_param, :media_share => { }
    assert_redirected_to media_share_path(assigns(:media_share))
  end

  test "should destroy media_share" do
    assert_difference('MediaShare.count', -1) do
      delete :destroy, :id => media_shares(:one).to_param
    end

    assert_redirected_to media_shares_path
  end
end
