require 'rails_helper'

RSpec.describe 'Motorcycles', type: :request do
  describe 'GET /Motorcycle' do
    it "GET /Motorcycle path" do
      get motorcycles_path
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end
end
