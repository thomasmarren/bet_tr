class Matchup < ActiveRecord::Base
  has_many :matchups_competitors
  has_many :competitors, through: :matchups_competitors
  belongs_to :matchup_type
end
