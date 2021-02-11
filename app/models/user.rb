class User < ApplicationRecord
  has_secure_password
  has_many :cocktails, dependent: :destroy
  validates :username, presence: true 
  validates :password, length: {minimum: 8, message: "Password needs to be more secure."}
 end
