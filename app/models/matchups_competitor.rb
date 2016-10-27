class MatchupsCompetitor < ActiveRecord::Base
  belongs_to :matchup
  belongs_to :competitor
  has_many :bets
end
