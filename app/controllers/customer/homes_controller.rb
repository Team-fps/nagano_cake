class Customer::HomesController < ApplicationController
  
  def top
    @items = Item.all
  end
  
  def about
  end
  
end
