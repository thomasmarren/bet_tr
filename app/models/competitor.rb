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
    ON bets.matchups_competitor_id = matchups_competitors.id
    JOIN competitors
    ON matchups_competitors.competitor_id = competitors.id
    WHERE competitors.id = #{self.id}
    SQL
    )
  end

  def has_no_matchups?
    self.matchups.empty?
  end

  def users
    user_ids = self.bets.map(&:user_id).uniq
    users = User.find(user_ids)
  end

  def has_no_users?
    self.users.empty?
  end

  def matchup_types
    matchups = self.matchups
    matchup_type_ids = matchups.map(&:matchup_type_id)
    MatchupType.find(matchup_type_ids)
  end

  def has_no_matchup_types?
    self.matchup_types.empty?
  end


  # def total_bets_amount
  #   bets.map(&:amount).inject(0){|sum,x| sum + x }
  # end
  #
  # #What to do next?
  # def bets_per_competitor
  #   Bet.find_by_sql(
  #   <<-SQL
  #   SELECT COUNT(bets) AS num_of_bets, SUM(bets.amount) AS amount, users.name AS user
  #   FROM users
  #   JOIN bets
  #   ON users.id = bets.user_id
  #   JOIN matchups_competitors
  #   ON bets.matchups_competitor_id = matchups_competitors.id
  #   JOIN competitors ON matchups_competitors.competitor_id = competitors.id
  #   WHERE competitors.id = #{self.id}
  #   GROUP BY users.name
  #   SQL
  #   )
  # end
  #
  # def chart_data_for_bets_per_competitor
  #   users = bets_per_competitor
  #   users.map do |user|
  #     [user.attributes["user"], user.amount]
  #   end
  # end

end
