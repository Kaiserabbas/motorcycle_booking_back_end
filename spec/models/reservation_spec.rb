require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'Instance of a Reservation' do
    it 'Expect to be an instance of Reservation' do
      reservation = Reservation.new
      expect(reservation).to be_an_instance_of(Reservation)
    end
  end

  context 'with invalid params' do
    it 'Should not be a valid Reservation with no params' do
      reservation = Reservation.new
      expect(reservation).to_not be_valid
    end

    it 'Should not be a valid Reservation with 1 param' do
      reservation = Reservation.new
      reservation.total = 200
      expect(reservation).to_not be_valid
    end
  end

  context 'with Valid params' do
    it 'Should save a new Reservation wit valid params' do
      user = User.create(name: 'Gra', email: 'gra@gmail.com', password: 'MadaraSama!', admin: true)

      motorcycle = Motorcycle.new
      motorcycle.name = 'Vespa'
      motorcycle.model = 'V2018'
      motorcycle.color = 'Red'
      motorcycle.chassisNumber = '2023RV15'
      motorcycle.brand = 'Vespa'
      motorcycle.bookingPricePerHour = 200
      motorcycle.price = 2000
      motorcycle.imageLink = 'https://web.postman.co/workspace/My-Workspace~a2a266d4-85ab-41a6-8e2d-3c026a33a3fd/request/create?requestId=199726b5-2868-425c-a935-9c16771ec617'
      motorcycle.save

      reservation = Reservation.new
      reservation.duration = 48
      reservation.total = motorcycle.bookingPricePerHour * reservation.duration
      reservation.user = user
      reservation.motorcycle = motorcycle
      reservation.city = 'Luanda'
      reservation.date = Date.today
      reservation.save
      expect(reservation).to be_valid
    end
  end
end
