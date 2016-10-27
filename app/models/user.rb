class User < ActiveRecord::Base

  has_many :bets
  has_many :matchups, through: :bets

  has_secure_password

  validates_presence_of :name, :username, :password
  validates_uniqueness_of :username, message: "Username already exists"

end
