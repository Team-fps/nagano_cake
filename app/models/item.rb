class Item < ApplicationRecord
  
  attachment :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  
  def add_tax_price
    (self.price * 1.10).round
  end
  
  validates :status, inclusion: { in: [true, false] }
  
end
