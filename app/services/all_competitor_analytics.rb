class AllCompetitorAnalytics

  def num_of_matchups_per_competitor
    mc = MatchupsCompetitor.find_by_sql(
    <<-SQL
    SELECT competitor_id, count(*) AS count
    FROM matchups_competitors
    GROUP BY matchups_competitors.competitor_id
    SQL
    )
    mc.map do |mc|
      [Competitor.find(mc.competitor_id).name, mc.count]
    end
  end

  def total_bets_all_competitors
    competitors = Competitor.find_by_sql(
    <<-SQL
    SELECT SUM(amount) AS bets, competitors.id, competitors.name
    FROM bets
    JOIN matchups_competitors
    ON bets.matchups_competitor_id = matchups_competitors.id
    JOIN competitors
    ON matchups_competitors.competitor_id = competitors.id
    GROUP BY competitors.id;
    SQL
    )
  end

  def total_number_of_bets
    competitors = total_bets_all_competitors
    competitors.map do |competitor|
      [competitor.name, competitor.bets.count]
    end
  end

  def total_value_of_bets
    competitors = total_bets_all_competitors
    competitors.map do |competitor|
      [competitor.name, competitor.bets.map(&:amount).inject {|sum,bet| sum + bet}]
    end
  end

  def average_bet
    competitors = total_bets_all_competitors
    competitors.map do |competitor|
      [competitor.name, (competitor.bets.map(&:amount).inject {|sum,bet| sum + bet}) / (competitor.bets.count)]
    end
  end



end
