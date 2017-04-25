require 'bcrypt'

class User < ActiveRecord::Base
  has_many :posts

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true
  validates :username, presence: true, length: {minimum: 3}

  include BCrypt

  def password
    @password ||= Password.new(password_hash) if password_hash
  end

  def password=(new_password)
    @password = Password.create(new_password) if new_password
    self.password_hash = @password
  end
end
