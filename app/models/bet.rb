class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :matchups_competitor
end
