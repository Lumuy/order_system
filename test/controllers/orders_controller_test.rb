require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user  = create(:user)
    @order = create(:order, user: @user, status: :prepare)
    post sessions_path, params: {email: @user.email, password: @user.password}
  end

  test "should filter orders with order status" do
    order1 = create(:order, status: :prepare)
    order2 = create(:order, status: :done)

    get orders_url, params: {filters: {status: 'done'}}

    assert @response.body =~ /#{order2.id}/
    refute @response.body =~ /#{order1.id}/
  end

  test 'should filter orders combine user email and order status' do
    order1 = create(:order, status: :done)
    order2 = create(:order, status: :done)

    get orders_url, params: {filters: {status: 'done', user_email: order2.user.email}}

    assert @response.body =~ /#{order2.id}/
    refute @response.body =~ /#{order1.id}/
  end
end

