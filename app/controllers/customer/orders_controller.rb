class Customer::OrdersController < ApplicationController

  def new
    @order = Order.new
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
    elsif params[:order][:address_option] == "2"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      end
    else
      redirect_to new_order_path
    end
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.count = cart.count
        order_detail.price_tax = cart.item.price
        order_detail.save
      end
      redirect_to complete_orders_path
      @cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def complete
  end

  def index
    @orders = current_customer.orders.page(params[:page]).reverse_order.per(5)
  end

  def show
    @order = Order.find(params[:id])
    @ordered_details = @order.order_details
    @order.shipping_cost = 800
    
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :order_status)
  end

  def address_params
    params.require(:order).permit(:postal_code, :address, :name )
  end

end
