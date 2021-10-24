class Admin::OrderDetailsController < ApplicationController

  def update
    @ordered_detail = OrderDetail.find(params[:id])
    @order = @ordered_detail.order

    if @ordered_detail.update(order_detail_params)
      @ordered.order_details.update_all(status: 1) if @ordered_detail.production_status == 1
      redirect_to request.referer
    else
      redirect_to request.referer
    end

  end

   private

  def order_detail_params
    params.require(:order_detail).permit(order: :order_status)[:order_status]
  end

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
