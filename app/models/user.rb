# app/models/user.rb
class User < ApplicationRecord
    has_secure_password
    # Validations
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, presence: true, length: { minimum: 6 }
    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
  end