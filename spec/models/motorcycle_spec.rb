require 'rails_helper'

RSpec.describe Motorcycle, type: :model do
  context 'Instance of a Motorcycle' do
    it 'Expect to be an instance of Motorcycle' do
      motorcycle = Motorcycle.new
      expect(motorcycle).to be_an_instance_of(Motorcycle)
    end
  end

  context 'with invalid params' do
    it 'Should not be a valid Motorcycle with no params' do
      motorcycle = Motorcycle.new
      expect(motorcycle).to_not be_valid
    end

    it 'Should not be a valid operation with 1 param' do
      motorcycle = Motorcycle.new
      motorcycle.name = 'Vespa'
      expect(motorcycle).to_not be_valid
    end
  end

  context 'with Valid params' do
    it 'Should save a new Motorcycle wit valid params' do
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
      expect(motorcycle).to be_valid
    end
  end
end
