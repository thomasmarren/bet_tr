class IndividualCompetitorAnalytics

  attr_reader :competitor

  def initialize(competitor)
    @competitor = competitor
  end

  def chart_total_bets_amount
    competitor.bets.map(&:amount).inject(0){|sum,x| sum + x }
  end

  #What to do next?
  def bets_per_competitor
    Bet.find_by_sql(
    <<-SQL
    SELECT COUNT(bets) AS num_of_bets, SUM(bets.amount) AS amount, users.name AS user
    FROM users
    JOIN bets
    ON users.id = bets.user_id
    JOIN matchups_competitors
    ON bets.matchups_competitor_id = matchups_competitors.id
    JOIN competitors ON matchups_competitors.competitor_id = competitors.id
    WHERE competitors.id = #{competitor.id}
    GROUP BY users.name
    SQL
    )
  end

  def chart_bets_per_competitor
    users = bets_per_competitor
    users.map do |user|
      [user.attributes["user"], user.amount]
    end
  end

end
