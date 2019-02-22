require 'test_helper'

class ProvidersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup :initialization

  test 'redirected if user not logged' do
    get providers_path
    assert_redirected_to new_user_session_path
  end

  test 'logged user should get index' do
    sign_in @user

    get providers_path
    assert_response :success
  end

  test 'logged user should access new form' do
    sign_in @user

    get new_provider_path
    assert_response :success
    assert_template :new
  end

  test 'logged user should create a provider' do
    sign_in @user

    assert_difference('Provider.count') do
      post providers_path, params: { provider: { name: Faker::Company.name } }
    end

    assert_redirected_to providers_path
  end

  test 'logged user should access edit form' do
    sign_in @user

    get edit_provider_path(@provider)
    assert_response :success
    assert_template :edit
  end

  test 'logged user should update a provider' do
    sign_in @user

    patch provider_path(@provider), params: { provider: { name: Faker::Company.name } }
    assert_redirected_to providers_path
  end

  test 'logged user should destroy a provider' do
    sign_in @user

    assert_difference('Provider.count', -1) do
      delete provider_path(@provider)
    end

    assert_redirected_to providers_path
  end

  private

  def initialization
    @user = users(:user_one)
    @provider = providers(:provider_one)
  end
end
