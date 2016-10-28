class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :matchups_competitor

  def matchup
    matchup_competitor.matchup
  end

  def competitor
    matchup_competitor.competitor
  end

  def matchup_competitor
    MatchupsCompetitor.find(self.matchups_competitors_id)
  end

end
