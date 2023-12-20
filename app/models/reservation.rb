class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle
  validates_presence_of :duration, :total, :user_id, :motorcycle_id, :date, :city
end
