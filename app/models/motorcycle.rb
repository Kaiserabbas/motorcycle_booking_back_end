class Motorcycle < ApplicationRecord
  has_many :reservations, dependent: :destroy
  validates_presence_of :name, :color, :bookingPricePerHour, :chassisNumber, :price, :model, :brand, :imageLink
  validates :chassisNumber, uniqueness: true
  validates :bookingPricePerHour, :price, numericality: { greater_than: 0 }

  def booked_for_reservation?
    reservations.present?
  end
end
