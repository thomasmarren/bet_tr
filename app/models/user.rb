class User < ActiveRecord::Base

  has_many :bets
  has_many :matchups, through: :bets
  after_initialize :init

  has_secure_password

  validates_presence_of :name, :username, :password_digest
  validates_uniqueness_of :username, message: " already exists"

  def init
    self.balance ||= 100
  end

  # MOVED TO SERVICE OBJECT (user_analytics.rb)
  # def winning_bets
  #   Bet.find_by_sql(
  #   <<-SQL
  #   SELECT user_id, count(matchups_competitors.winner) as won
  #   FROM bets JOIN matchups_competitors
  #   ON bets.matchups_competitor_id = matchups_competitors.id
  #   JOIN users
  #   ON bets.user_id = users.id
  #   WHERE matchups_competitors.winner = true AND user_id = #{self.id}
  #   GROUP BY bets.user_id
  #   SQL
  # end

end
