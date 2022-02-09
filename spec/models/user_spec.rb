require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'password can not be blank' do
      @user = User.create( 
        first_name: "Jack",
        last_name: "Daniels",
        email: "123@gmail.com",
        # password: "12345678", 
        password_confirmation: "12345678" )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Password can't be blank")
      end

      it 'password confirmation can not be blank' do
        @user = User.create( 
          first_name: "Jack",
          last_name: "Daniels",
          email: "123@gmail.com",
          password: "12345678", 
          # password_confirmation: "12345678" 
          )
          expect(@user).to_not be_valid
          expect(@user.errors.full_messages[0]).to eq("Password confirmation can't be blank")
        end  

      it 'password and password_confirmation need to match' do
      @user = User.create( 
        first_name: "Jack",
        last_name: "Daniels",
        email: "123@gmail.com",
        password: "12345678", 
        password_confirmation: "12345679" )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
      end

  it 'email must be unique' do
      @user1 = User.create( 
      first_name: "Jack",
      last_name: "Daniels",
        email: "TEST@TEST.com",
        password: "12345678", 
        password_confirmation: "12345678" )
        @user1.save!
      @user2 = User.create( 
        first_name: "Jack",
        last_name: "Daniels",
          email: "test@test.COM",
          password: "12345678", 
          password_confirmation: "12345678" )
    expect(@user2).to_not be_valid
    expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")
    end

    it 'Email cannot be blank' do
      @user = User.create( 
        first_name: "Jack",
        last_name: "Daniels",  
        password: "12345678", 
        password_confirmation: "12345678" )
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
    end

    it 'first name cannot be blank' do
      @user = User.create( 
      last_name: "Daniels",
        password: "12345678", 
        email: "TEST@TEST.com",
        password_confirmation: "12345678" )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("First name can't be blank")    
      end

    it 'last name should  be required' do
      @user = User.create( 
        first_name: "Jack",
        password: "12345678", 
        email: "TEST@TEST.com",
        password_confirmation: "12345678" )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
        
      end

    it 'user can create valid user with correctly entered credential' do
    @user = User.create( 
      first_name: "Jack",
      last_name: "Daniels",
      email: "123@gmail.com",
      password: "12345678", 
      password_confirmation: "12345678" )
    expect(@user).to be_valid
    end

    it 'password has at least 8 digits' do
      @user = User.create( 
        first_name: "Jack",
        last_name: "Daniels",
        email: "123@gmail.com",
        password: "1234567", 
        password_confirmation: "1234567" )
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 8 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    
    it 'redirects authenticated user to main page' do
    @user = User.create(
      first_name: "Jack",
      last_name: "Daniels",      
      email: "123@gmail.com",
      password: "12345678",
      password_confirmation: "12345678"
      )
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(@user)
    end
    
    it 'logs in user who types in a few spaces before and/or after their email address' do
    @user = User.create(
      first_name: "Jack",
      last_name: "Daniels",      
      email: "123@gmail.com",
      password: "12345678",
      password_confirmation: "12345678"
      )
    expect(User.authenticate_with_credentials("  123@gmail.com ", "12345678")).to eq(@user)
    end

    it 'logs in user who types in the wrong case for their email' do
      @user = User.create(
        first_name: "Jack",
        last_name: "Daniels",          email: "danny@gmail.com",
        password: "12345678",
        password_confirmation: "12345678"
        )
        expect(User.authenticate_with_credentials('DANNY@gmail.com', "12345678")).to eq(@user)
      end

  end

end
