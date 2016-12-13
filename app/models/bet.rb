class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :matchups_competitor

  def matchup
    matchups_competitor.matchup
  end

  def competitor
    matchups_competitor.competitor
  end

  def payout_amount
    if matchup.odds
      matchup.odds * amount
    else
      amount
    end
  end

  def resolve
    if matchups_competitor.winner == true
      # get payout money + your original bet amount back
      user.balance += (payout_amount + amount)
      user.save
    end
    self.update(status: "closed")
  end

end
