class User < ApplicationRecord
  has_secure_password
  has_many :cocktails, dependent: :destroy
  validates :username, :email, :first_name, presence: true 
  validates :password, length: {minimum: 8, message: "Password needs to be more secure."}
 end
