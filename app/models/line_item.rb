class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def total
    total = quantity * product.price
  end
end
