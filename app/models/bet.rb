class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :matchups_competitor

  def matchup
    MatchupsCompetitor.find(self.matchups_competitors_id).matchup
  end

  def competitor
    MatchupsCompetitor.find(self.matchups_competitors_id).competitor
  end

end
