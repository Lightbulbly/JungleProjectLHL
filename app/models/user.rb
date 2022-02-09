# app/models/user.rb
    
class User < ActiveRecord::Base

    has_secure_password
  
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates_uniqueness_of :email, case_sensitive: false, presence: true

    validates :password, presence: true, length: { minimum: 3 }
    validates :password_confirmation, presence: true
    # validates :password, confirmation:  true
    

#     a new class method authenticate_with_credentials on the User model.
# It will take as arguments: the email address and password the user typed into the login form,
# And return: an instance of the user (if successfully authenticated), or nil (otherwise)
    def self.authenticate_with_credentials (email, password)
    user = User.find_by_email(email.downcase.strip)
      if user && user.authenticate(password)
        user
      else
        nil
      end
    end
  end


  