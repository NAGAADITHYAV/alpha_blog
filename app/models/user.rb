# User Management
class User < ApplicationRecord
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 105 }, 
                    format: { with: REGEX }
  has_secure_password

  has_many :articles

  before_save { self.email = email.downcase }
end
