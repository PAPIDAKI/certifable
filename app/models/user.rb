class User < ApplicationRecord
  attr_accessor :remember_token
  before_save {email.downcase!}

  validates :name,presence: true,length:{minimum:2, maximum: 50}
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email,presence: true,length:{maximum: 255},format:{with:VALID_EMAIL_REGEX},uniqueness: {case_sensitive: false}
  

  has_secure_password
  validates :password,presence: true,length: 
    {minimum:4}

  #returns the hash digest of the ginen string 
   def User.digest(string)
     cost=ActiveModel::SecurePassword.min_cost ?
     BCrypt::Engine::MIN_COST : 
     BCrypt::Engine.cost
     BCrypt::Password.create(string,cost: cost )
   end


  #Generates a random token
  def User.new_token
    SecureRandom.urlsafe_base64 #SecureRandom is a library included in Rails 
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest ,User.digest(remember_token)) # we make the rember_tokem an accessor and assignit to the User.remember attribute by updating it
  end
end

