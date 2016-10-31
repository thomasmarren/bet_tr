class Matchup < ActiveRecord::Base
  has_many :matchups_competitors
  has_many :competitors, through: :matchups_competitors
  belongs_to :matchup_type

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
