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
      user4 = User.create({
        name: 'Aragorn', 
        email: 'aragorn@john.com',
        password: 'the return',
        password_confirmation: 'of the king'
      })
      expect(user4.errors.full_messages).to include('Password confirmation doesn\'t match Password')
      expect(user4).to_not be_valid
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
      user5 = User.create({
        name: nil, 
        email: 'frodo@john.com',
        password: 'stupid hobbit',
        password_confirmation: 'stupid hobbit'
      })
      expect(user5.errors.full_messages).to include('Name can\'t be blank')
      expect(user5).to_not be_valid
    end

    it 'is not valid without an email' do
      user6 = User.create({
        name: 'Sam', 
        email: nil,
        password: 'stupid fat hobbit',
        password_confirmation: 'stupid fat hobbit'
      })
      expect(user6.errors.full_messages).to include('Email can\'t be blank')
      expect(user6).to_not be_valid
    end

    it 'is valid when password meets minimum length required' do
      user7 = User.create({
        name: 'Gandalf', 
        email: 'white@wizard.me',
        password: 'me',
        password_confirmation: 'me'
      })
      expect(user7.errors.full_messages).to include('Password is too short (minimum is 10 characters)')
      expect(user7).to_not be_valid
    end

  end

  describe '.autenticate_with_credentials' do
    it 'ignores spaces around email' do
      user8 = User.create({
        name: 'Boromir', 
        email: '   sean@bean.dies',
        password: 'me',
        password_confirmation: 'me'
      })
      expect(user8.autenticate_with_credentials(user8.email, user8.password)).to be_true
    end


  end

end
