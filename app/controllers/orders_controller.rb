class OrdersController < ApplicationController
  before_action :authenticate_user
  before_action :set_order, only: [:edit, :update]

  def index
    @filters = params[:filters]&.to_unsafe_h || {}
    @orders  = Order.query_filter(@filters)
                    .includes(:user)
                    .page(params[:page])
                    .per(20)
  end

  def edit
  end

  def update
    if @order.update(update_order_params)
      redirect_to orders_path
    else
      render :edit
    end
  end

  def filter
    redirect_to orders_path(filters: filter_params)
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def update_order_params
    params.require(:order).permit(:status)
  end

  def filter_params
    params.require(:order).permit(:status, :user_email)
  end
end

