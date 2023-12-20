require 'rails_helper'

RSpec.describe Motorcycle, type: :model do
  context 'Instance of a Motorcycle' do
    it 'Expect to be an instance of Motorcycle' do
      motorcycle = Motorcycle.new
      expect(motorcycle).to be_an_instance_of(Motorcycle)
    end
  end
end
