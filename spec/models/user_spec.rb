require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Instance of a Model' do
    it 'Expect to be an instance of User' do
      user = User.new
      expect(user).to be_an_instance_of(User)
    end
  end

  context 'with invalid params' do
    it 'Should not be a valid user with no params' do
      user = User.new
      expect(user).to_not be_valid
    end

    it 'Should not be a valid user with only email and name param' do
      user = User.new
      user.name = 'Graciano Henrique'
      expect(user).to_not be_valid
    end
  end

  context 'with Valid params' do
    it 'Should save a new user wit valid params' do
      user = User.new
      user.name = 'Gra'
      user.email = 'gracianomanuelhenrique@gmail.com'
      user.password = 'MariaCangombe'
      expect(user).to be_valid
    end
  end

  context 'Object should contain methods' do
    it 'Should have the methods {:name,:email,:created_at} ' do
      user = User.new
      user.name = 'Gra'
      user.email = 'gracianomanuelhenrique@gmail.com'
      expect(user).to respond_to(:name, :email, :created_at)
    end
  end
end
