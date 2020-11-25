class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address, optional: true
  has_many :line_items #, dependent: :destroy
end
