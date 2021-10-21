class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def add_tax_price
    (self.price * 1.10).round
  end

  def sum_of_price
    item.price * count
  end


end
