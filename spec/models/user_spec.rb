require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    user = User.create({
      name: 'Aaron', 
      email: 'johnaaron@john.com',
      password: 'aaronjohn',
      password_confirmation: 'aaronjohn'
    })
    
    it 'is not valid when password and password_confirmation is blank' do 
      user3 = User.create({
        name: 'Gimli', 
        email: 'gimli@john.com',
        password: nil,
        password_confirmation: nil
      })
      expect(user3.errors.full_messages).to include('Password can\'t be blank')
      expect(user3).to_not be_valid
    end


    it 'is is invalid when password does not match with password_confirmation' do
      user.password = 'aaronjohn'
      user.password_confirmation = 'aaron'
      expect(user).to_not be_valid
    end


    it  'does not validate when matched with an email within the database (not case sensitive)' do
      user2 = User.create({
        name: 'John',
        email: 'JOHNAARON@JOHN.com',
        password: 'johnaaron',
        password_confirmation: 'johnaaron'
      })
      expect(user2.errors.full_messages).to include('Email has already been taken')
      expect(user2).to_not be_valid
    end

    it 'is not valid without a name' do

    end

    it 'is not valid without an email'

    it 'is valid when password meets minimum length required'


  end
end
