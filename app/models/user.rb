# app/models/user.rb
class User < ApplicationRecord
    has_secure_password
    has_many :projects
    # Validations
    validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, presence: true, length: { minimum: 6 }
    validates :role, presence: true
    validates :username, presence: true, uniqueness: true
    enum role: { admin: 0, manager: 1, developer: 2 }
  end

  