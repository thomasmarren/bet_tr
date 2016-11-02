class UserCompetitorAnalytics

  attr_reader :user, :competitor

  def initialize(user, competitor)
    @user = user
    @competitor = competitor
  end

  def number_of_bets_on_a_competitor
    user.bets.select{|bet| bet.matchups_competitor.competitor.id == competitor.id}.count
  end

  def total_bets_on_a_competitor
    user.bets.select{|bet| bet.matchups_competitor.competitor.id == competitor.id}.map(&:amount).inject{|sum,bet| sum + bet}
  end

end
