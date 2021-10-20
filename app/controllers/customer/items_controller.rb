class Customer::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @item = Item.find( prams[:id] )
  end

end
