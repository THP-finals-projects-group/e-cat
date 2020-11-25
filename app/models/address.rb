class Address < ApplicationRecord
	belongs_to :user

	validates_presence_of :street_name, :street_number, :zipcode, :city, :country
end
