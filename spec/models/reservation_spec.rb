require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'Instance of a Reservation' do
    it 'Expect to be an instance of Reservation' do
      reservation = Reservation.new
      expect(reservation).to be_an_instance_of(Reservation)
    end
  end
end
