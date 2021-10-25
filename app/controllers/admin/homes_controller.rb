class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page]).reverse_order
    @order = OrderDetail.where(order_id: @orders.ids)
    
  end
end
