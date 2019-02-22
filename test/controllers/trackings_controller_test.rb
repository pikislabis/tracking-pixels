require 'test_helper'

class TrackingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup :initialization

  test 'redirected if user not logged' do
    get provider_trackings_path(@provider)
    assert_redirected_to new_user_session_path
  end

  test 'logged user should get index' do
    sign_in @user

    get provider_trackings_path(@provider)
    assert_response :success
  end

  test 'logged user should destroy a tracking' do
    sign_in @user

    assert_difference('Tracking.count', -1) do
      delete provider_tracking_path(@provider, @tracking)
    end

    assert_redirected_to provider_trackings_path(@provider)
  end

  private

  def initialization
    @user = users(:user_one)
    @provider = providers(:provider_one)
    @tracking = trackings(:tracking_one)
  end
end
