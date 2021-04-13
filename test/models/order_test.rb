require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test 'valid factory' do
    assert build(:order).valid?
  end

  test 'scope with_user_email and with_status combination' do
    user1 = create(:user)
    user2 = create(:user)
    create(:order, user: user1, status: :prepare)
    create(:order, user: user1, status: :done)
    create(:order, user: user2, status: :prepare)
    create(:order, user: user2, status: :processing)

    assert_equal Order.with_status(:prepare).count, 2
    assert_equal Order.with_status(:prepare).with_user_email(user1.email).count, 1
  end
end

