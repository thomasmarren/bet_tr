class Competitor < ActiveRecord::Base
  has_many :matchups_competitors
  has_many :matchups, through: :matchups_competitors
end
