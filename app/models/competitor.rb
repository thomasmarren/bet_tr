class Competitor < ActiveRecord::Base
  has_many :matchups_competitors
  has_many :matchups, through: :matchups_competitors

  validates_presence_of :name
  validates_uniqueness_of :name, message: "Competitor already exists"

  def name
    self[:name].upcase unless self[:name].nil?
  end

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

  def users
    user_ids = bets.map(&:user_id).uniq
    users = User.find(user_ids)
  end

  def total_bets_amount
    bets.map(&:amount).inject(0){|sum,x| sum + x }
  end

  def matchup_types
    matchups = self.matchups
    matchup_type_ids = matchups.map(&:matchup_type_id)
    MatchupType.find(matchup_type_ids)
  end

end
