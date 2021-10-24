class Customer::HomesController < ApplicationController
  
  def top
    @items = Item.order(created_at: :desc).limit(4)
    @item = Item.find(1)
  end
  
  def about
  end
  
end
