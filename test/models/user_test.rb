require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid factory' do
    assert build(:user).valid?
  end
end
