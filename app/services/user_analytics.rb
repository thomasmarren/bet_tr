class UserAnalytics

  attr_reader :user

  def initialize(user)
    @user = user
  end

  #users#show
  def winning_bets
    Bet.find_by_sql(
    <<-SQL
    SELECT user_id, count(matchups_competitors.winner) as won
    FROM bets JOIN matchups_competitors
    ON bets.matchups_competitor_id = matchups_competitors.id
    JOIN users
    ON bets.user_id = users.id
    WHERE matchups_competitors.winner = true AND user_id = #{user.id}
    GROUP BY bets.user_id
    SQL
    )
  end
  ############

  #users#show
  def count_winning_bets
    UserAnalytics.new(user).winning_bets.first.won.to_f
  end

  def win_rate
    (count_winning_bets * 100) / user.bets.where("status = 'closed'").count.to_f
  end
  ###########

end
