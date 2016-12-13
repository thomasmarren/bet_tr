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
    DateTime.now + 5.days
  end

  def matchup_name
    if competitors.first.id > competitors.last.id
      name = "#{competitors.last.name} VS #{competitors.first.name}"
    else
      name = "#{competitors.first.name} VS #{competitors.last.name}"
    end
  end

  def randomize
    @matchup = Matchup.new(name: matchup_name, deadline: deadline, matchup_type_id: matchup_type.id)
    @matchup.competitors = competitors
    @matchup
  end

end
