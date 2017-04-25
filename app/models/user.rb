require 'bcrypt'

class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true
  validates :username, presence: true, uniqueness: true, length: {minimum: 3}

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
