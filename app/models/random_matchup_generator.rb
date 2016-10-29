class RandomMatchupGenerator

  def competitors
    #Only for matchups betwen two competitors
    competitors = Competitor.order_by_rand.limit(2).all
    until competitors.ids.uniq.length == competitors.ids.length
      competitors = Competitor.order_by_rand.limit(2).all
    end
    competitors
  end

  def matchup_type
    MatchupType.order_by_rand.first
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
