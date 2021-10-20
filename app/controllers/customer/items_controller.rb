class Customer::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
    @customer = current_customer
  end

  def show
    @item = Item.find( params[:id] )
    @genres = Genre.all
    @customer = current_customer
  end

end
