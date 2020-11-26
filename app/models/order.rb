class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address, optional: true

  has_many :order_items
  has_many :products, through: :order_items
end
