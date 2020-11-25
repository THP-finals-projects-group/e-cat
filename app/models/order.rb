class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address
  has_many :line_items #, dependent: :destroy
end
