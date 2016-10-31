class Matchup < ActiveRecord::Base
  has_many :matchups_competitors
  has_many :competitors, through: :matchups_competitors
  belongs_to :matchup_type

  def closed?
    self.deadline < Time.now && self.status == "closed"
  end

  def winner
    competitors = self.competitors
    range = rand(1..100)
    unless self.closed?
      if range > 0 && range < 50
        winner = competitors[0]
        loser = competitors[1]
      else
        winner = competitors[1]
        loser = competitors[0]
      end
      won = MatchupsCompetitor.find_by(competitor_id: winner.id, matchup_id: self.id)
      lost = MatchupsCompetitor.find_by(competitor_id: loser.id, matchup_id: self.id)
      won.winner = true
      lost.winner = false
      won.save
      lost.save
      won.bets.each do |bet|
        bet.resolve
      end
      self.update(status: "closed")
    end
  end

  #Analytics Categories
  # Bets by competitor/ Total Amount Bet / Bets by User? / Total Number of Bets
  # Maybe write methods for the analytics using heredoc SQL commands?
  # Test that these methods return the proper data?
  #> other_method_ideas.length
  #> 0
  # Matchup.find_by_sql

  def get_num_matchups_for_chart
    data = Matchup.group(:matchup_type_id).count
    data.each_with_object({}) { |(key, value), hash| hash[MatchupType.find(key).name] = value }
  end

  def format_time
    self.deadline.strftime("%B %d %Y %I:%M:%S %Z%z")
  end
  #
  # def get_bets_by_competitor
  #   data =
  # end

  # Matchup.find_by_sql("select matchup_type_id from matchups group by matchups.matchup_type_id")

end
# matchups.matchup_type_id AS matchups_matchup_type_id
