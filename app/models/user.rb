class User < ApplicationRecord
  has_many :cars
  has_many :bookings
  # has_many :cars, through: :bookings
  has_many :reviews
  has_many :messages
  has_many :chatrooms, through: :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :birth_date, :address, presence:true
  has_one_attached :photo
end
