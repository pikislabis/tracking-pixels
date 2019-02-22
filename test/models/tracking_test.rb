require 'test_helper'

class TrackingTest < ActiveSupport::TestCase
  def setup
    @provider = providers(:provider_one)
  end

  test 'valid provider' do
    tracking = Tracking.new(name: Faker::Internet.name, provider_id: @provider.id)
    assert tracking.valid?
  end

  test 'invalid without name' do
    tracking = Tracking.new(provider_id: @provider.id)
    refute tracking.valid?
    assert_not_nil tracking.errors[:name]
  end

  test 'invalid without provider association' do
    tracking = Tracking.new(name: Faker::Internet.name)
    refute tracking.valid?
    assert_not_nil tracking.errors[:provider_id]
  end
end
