class Customer::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    # @order.carriage = 800
  end

end
