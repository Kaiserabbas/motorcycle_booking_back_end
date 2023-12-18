class Motorcycle < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
