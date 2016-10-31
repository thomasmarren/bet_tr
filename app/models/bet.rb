class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :matchups_competitor
  # after_initialize do |bet|
  #   init
  # end
  # validates :amount, numericality: {less_than_or_equal_to: current_user.balance}

  # def init
  #   self.status ||= "Open"
  # end

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
    # work on the logic here. what is deadline?
    if matchups_competitor.winner == true
      # get payout money + your original bet amount back
      user.balance += (payout_amount + amount)
      user.save
    end
  end

end
