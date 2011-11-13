# app/models/user.rb
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.find_for_open_id_oauth(access_token, signed_in_resource=nil)
    email = access_token.info['email']
    if user = User.find_by_email(email)
      user
    else
      User.create!(:email => email, :password => Devise.friendly_token[0,20]) 
    end
  end
end
