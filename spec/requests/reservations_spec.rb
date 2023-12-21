require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  describe 'GET /Reservation' do
    it 'GET /Motorcycle path' do
      get api_v1_reservations_path
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end
  end
end
