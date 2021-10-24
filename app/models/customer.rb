class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum is_deleted: { 有効: false, 退会: true }

  has_many :addresses
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy


end
