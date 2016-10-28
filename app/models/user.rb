class User < ActiveRecord::Base

  has_many :bets
  has_many :matchups, through: :bets
  after_initialize :init

  has_secure_password

  validates_presence_of :name, :username, :password
  validates_uniqueness_of :username, message: " already exists"

  def init
    self.balance = 100
  end

end
