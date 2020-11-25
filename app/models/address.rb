class Address < ApplicationRecord
	belongs_to :user
	has_many   :orders
	validates_presence_of :street_name, :street_number, :zip_code, :city, :country
end
