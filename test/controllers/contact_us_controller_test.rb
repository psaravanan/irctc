require 'test_helper'

class ContactUsControllerTest < ActionController::TestCase
  setup do
    @contact_u = contact_us(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_us)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_u" do
    assert_difference('ContactU.count') do
      post :create, contact_u: { email: @contact_u.email, message: @contact_u.message, name: @contact_u.name }
    end

    assert_redirected_to contact_u_path(assigns(:contact_u))
  end

  test "should show contact_u" do
    get :show, id: @contact_u
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_u
    assert_response :success
  end

  test "should update contact_u" do
    patch :update, id: @contact_u, contact_u: { email: @contact_u.email, message: @contact_u.message, name: @contact_u.name }
    assert_redirected_to contact_u_path(assigns(:contact_u))
  end

  test "should destroy contact_u" do
    assert_difference('ContactU.count', -1) do
      delete :destroy, id: @contact_u
    end

    assert_redirected_to contact_us_path
  end
end
