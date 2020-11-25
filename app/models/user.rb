class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_one_attached :avatar
  has_many :addresses
  has_many :carts
  has_many :orders
  validates_presence_of :firstname, :lastname
end
