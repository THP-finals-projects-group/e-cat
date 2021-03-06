class Product < ApplicationRecord
	has_one_attached 	:image
	has_many 			:line_items, dependent: :delete_all

	has_many :order_items
	has_many :orders, through: :order_items

	validates_presence_of :title, :description, :price
	validates :title, length: {in: 3...64}
	validates :title, uniqueness: {case_sensitive: false}
	validates :price, numericality: {greater_than_or_equal_to: 1}
	validates :description, length: {in: 25...5000}
end
