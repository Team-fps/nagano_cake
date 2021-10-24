class Customer::OrdersController < ApplicationController

  def new
    @oder = Oder.new
    @cart_item = CartItem.where(customer_id: current_customer.id)
  end

  def confirm
  end
  
  def create
  end

  def complete
  end

  def index
    @orders = Order.page(params[:page]).reverse_order
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    # @order.carriage = 800
  end

  private
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status)
  end

end
