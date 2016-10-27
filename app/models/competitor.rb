class Competitor < ActiveRecord::Base
  has_many :matchups_competitors
  has_many :matchups, through: :matchups_competitors

  validates_presence_of :name
  validates_uniqueness_of :name, message: "Competitor already exists"
end
