class Admin::HomesController < ApplicationController
  def top
    @customers = Customer.page(params[:page]).reverse_order
  end
end
