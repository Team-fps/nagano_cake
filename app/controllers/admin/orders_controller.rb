class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @ordered_details = @order.order_details
    
    @order.shipping_cost = 800
  end

  def update
    @order = Order.find(params[:id])
    @ordered_detail = @order.order_details

    if @order.update(order_params)
      @ordered.order_details.update_all(status: 1) if @order.order_status == 1
      redirect_to request.referer
    else
      redirect_to request.referer
    end

  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_detail_params
    params.require(:order).permit(order_details: :production_status)[:production_status]
  end

end
