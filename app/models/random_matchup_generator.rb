class RandomMatchupGenerator

  def competitors
    #Only for matchups betwen two competitors
    Competitor.find_by_sql("SELECT * FROM competitors ORDER BY RANDOM() LIMIT 2")
  end

  def matchup_type
    MatchupType.find_by_sql("SELECT * FROM matchup_types ORDER BY RANDOM() LIMIT 1").first
  end

  def deadline
    #chooses a random deadline between tomorrow and 5 days
    DateTime.now + rand(1..5)
  end

  def matchup_name
    competitors.map(&:name).join(" vs ")
  end

  def randomize
    @matchup = Matchup.new(name: matchup_name, deadline: deadline, matchup_type_id: matchup_type.id)
    @matchup.competitors = competitors
    @matchup
  end

end
