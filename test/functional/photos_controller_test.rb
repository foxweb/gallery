require File.dirname(__FILE__) + '/../test_helper'

class PhotosControllerTest < ActionController::TestCase
  def setup
    login_as :quentin
  end
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:photos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_photo
    assert_difference('Photo.count') do
      post :create, :photo => { :title => 'Example photo', :description => 'Example', :filename => 'example.jpg', :content_type => 'image/jpeg', :size => 123 }
      assert_valid assigns('photo')
    end

    assert_redirected_to photo_path(assigns(:photo))
  end

  def test_should_show_photo
    get :show, :id => photos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => photos(:one).id
    assert_response :success
  end

  def test_should_update_photo
    put :update, :id => photos(:one).id, :photo => { :title => 'Another title', :content_type => 'image/jpeg' }
    assert_valid assigns('photo')
    assert_redirected_to photo_path(assigns(:photo))
  end

  def test_should_destroy_photo
    assert_difference('Photo.count', -1) do
      delete :destroy, :id => photos(:one).id
    end

    assert_redirected_to photos_path
  end
end
