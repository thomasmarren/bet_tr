class Competitor < ActiveRecord::Base
  has_many :matchups_competitors
  has_many :matchups, through: :matchups_competitors

  validates_presence_of :name
  validates_uniqueness_of :name, message: "Competitor already exists"


  def bets
    Bet.find_by_sql(
    <<-SQL
    SELECT *
    FROM bets
    JOIN matchups_competitors
    ON bets.matchups_competitors_id = matchups_competitors.id
    JOIN competitors
    ON matchups_competitors.competitor_id = competitors.id
    WHERE competitors.id = #{self.id}
    SQL
    )
  end

  def users_who_bet
    user_ids = bets.map(&:user_id).uniq
    users = User.find(user_ids)
  end

end
