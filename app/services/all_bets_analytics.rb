class AllBetsAnalytics

  def total_bets_all_users
    bets = Bet.find_by_sql("SELECT user_id, count(*) as count FROM bets JOIN users ON bets.user_id = users.id GROUP BY bets.user_id")
    bets.map {|bet| [bet.user.username, bet.count]}
  end

  def total_winning_bets_all_users
    bets = Bet.find_by_sql("SELECT user_id, count(*) as count FROM bets JOIN matchups_competitors ON bets.matchups_competitor_id = matchups_competitors.id JOIN users ON bets.user_id = users.id WHERE matchups_competitors.winner = true GROUP BY bets.user_id ORDER BY count DESC")
    bets.map {|bet| [bet.user.username, bet.count]}
  end

  def winning_bets_leaders
    # should find a way to make these find by UNIQUE matchups to prevent spamming
    # small bets to rack up "wins"
    Bet.find_by_sql("SELECT user_id, count(*) as count FROM bets JOIN matchups_competitors ON bets.matchups_competitor_id = matchups_competitors.id JOIN users ON bets.user_id = users.id WHERE matchups_competitors.winner = true GROUP BY bets.user_id ORDER BY count DESC")
  end

end
