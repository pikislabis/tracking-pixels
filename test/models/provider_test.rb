require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  test 'valid provider' do
    provider = Provider.new(name: Faker::Company.name, description: Faker::Lorem.paragraph)
    assert provider.valid?
  end

  test 'invalid without name' do
    provider = Provider.new(description: Faker::Lorem.paragraph)
    refute provider.valid?
    assert_not_nil provider.errors[:name]
  end
end
