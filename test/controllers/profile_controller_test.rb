require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:user_one)
  end

  test 'a logged user should access its profile' do
    sign_in @user

    get my_profile_path
    assert_response :success
    assert_template :edit
  end

  test 'a logged user should update its password' do
    sign_in @user

    new_password = Faker::Internet.password

    patch update_my_profile_path,
      params: { user: { password: new_password, password_confirmation: new_password } }

    assert_redirected_to root_path
  end

  test 'a logged user should recreat its API Token' do
    sign_in @user

    old_api_token = @user.api_token

    patch recreate_api_token_path
    assert_not_equal(@user.reload.api_token, old_api_token)
  end
end
