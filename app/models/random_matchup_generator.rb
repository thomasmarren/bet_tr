class RandomMatchupGenerator

  def randomize

    competitors = Competitor.order_by_rand.limit(2).all

    until competitors.ids.uniq.length == competitors.ids.length
      competitors = Competitor.order_by_rand.limit(2).all
    end

    matchup_type = MatchupType.order_by_rand.first

    #chooses a random deadline between tomorrow and 5 days
    deadline = DateTime.now + rand(1..5)

    @matchup = Matchup.new(deadline: deadline, matchup_type_id: matchup_type.id)
    #@matchup.name = "#{@competitor1.name} VS #{@competitor2.name}"
    @matchup.competitors = competitors

  end

end
