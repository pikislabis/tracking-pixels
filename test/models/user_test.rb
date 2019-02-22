require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: Faker::Internet.email, password: Faker::Internet.password(6))
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(password: Faker::Internet.password(6))
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test 'invalid without password' do
    user = User.new(email: Faker::Internet.email)
    refute user.valid?
    assert_not_nil user.errors[:password]
  end

  test 'invalid with password length less than 6 characters' do
    user = User.new(password: Faker::Internet.password(1, 5))
    refute user.valid?
    assert_not_nil user.errors[:password]
  end
end
