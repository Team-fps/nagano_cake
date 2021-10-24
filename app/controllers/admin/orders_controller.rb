class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @ordered_products = @order.order_details
  end

  # def update
  #   order = Order.find(params[:id])
  #   ActiveRecord::Base.transaction do
  #     order.update_attributes!(order_params)
  #     OrderDetail.multi_update(order_detail_params)
  #   end
  #   redirect_back(fallback_location: root_path)
  # end

  private

  def order_params
    params.require(:order).permit(:order_status).merge(order_details: production_status)
  end

  def order_detail_params
    params.require(:order).permit(order_details: :production_status)[:production_status]
  end

end
