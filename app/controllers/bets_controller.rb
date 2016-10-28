class BetsController < ApplicationController

  def new
    # matchup = Matchup.find(params[:matchup_id])
    # competitor = Matchup.find(params[:competitor_id])
    # @matchup_competitor = MatchupsCompetitor.find_by(matchup_id: matchup.id, competitor_id: competitor.id)
    @matchup_competitor = MatchupsCompetitor.find(36)
  end

  def create
    # amount must be > 0 and not nil
    bet = Bet.new(bet_params)
    bet.user_id = session[:user_id]
    bet.save
    user = User.find(current_user.id)
    user.balance -= bet.amount
    user.save!

    redirect_to user
  end


  private

  def bet_params
    params.require(:bet).permit(:amount, :matchups_competitors_id)
  end
end
