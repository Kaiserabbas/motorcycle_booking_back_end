class Motorcycle < ApplicationRecord
  has_one :reservation, dependent: :destroy
  validates_presence_of :name, :color, :bookingPricePerHour, :chassisNumber, :price, :model, :brand
  validates :bookingPricePerHour, :price, numericality: { greater_than: 0 }
end
