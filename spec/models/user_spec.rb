require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'is not valid without a password' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com'
      )
      expect(user).to_not be_valid
    end

    it 'is not valid without matching password and password_confirmation' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'differentpassword'
      )
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
    end

    # describe 'Email' do
    #   it 'should be unique (case insensitive)' do
    #     User.create(
    #       first_name: 'John',
    #       last_name: 'Doe',
    #       email: 'john.doe@example.com',
    #       password: 'password',
    #       password_confirmation: 'password'
    #     )
  
    #     user = User.new(
    #       first_name: 'Jane',
    #       last_name: 'Doe',
    #       email: 'JOHN.DOE@example.com', # Note: Different case
    #       password: 'password',
    #       password_confirmation: 'password'
    #     )
  
    #     expect(user).not_to be_valid
    #     expect(user.errors[:email]).to include('has already been taken')
    #   end
    # end
  end
  
end
