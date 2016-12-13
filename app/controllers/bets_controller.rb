class BetsController < ApplicationController

  before_action :require_login
  before_action :require_admin, except: [:new, :create, :show]

  def index
    #require admin access too
    @users = User.all
    @users_select_array = @users.each_with_object([]) do |user, array|
      array << [user.username, user.id]
    end
    if params[:user_id]
      @user = User.find(params[:user_id])
      @bets = @user.bets
    else
      @bets = Bet.all
      @chart1 = AllBetsAnalytics.new.total_bets_all_users
    end
  end

  def new
    matchup = Matchup.find(params[:matchup])
    competitor = Competitor.find(params[:competitor])
    @matchup_competitor = MatchupsCompetitor.find_by(matchup_id: matchup.id, competitor_id: competitor.id)
    @current_user = current_user
  end

  def create
    if valid_bet?
      bet = Bet.new(bet_params)
      bet.user_id = session[:user_id]
      bet.save
      user = User.find(current_user.id)
      user.balance -= bet.amount
      user.save!
      redirect_to user
    else
      @matchup_competitor = MatchupsCompetitor.find(params[:bet][:matchups_competitor_id])
      render :new
    end
  end

  def show
    @bets = AllBetsAnalytics.new.winning_bets_leaders
    @chart2 = AllBetsAnalytics.new.total_winning_bets_all_users
  end

  private

  def bet_params
    params.require(:bet).permit(:amount, :matchups_competitor_id)
  end

  def valid_bet?
    if params[:bet][:amount] == "" || params[:bet][:amount].to_i <= 0
      flash[:bet_message] = "You must place a bet"
      false
    elsif params[:bet][:amount].to_i > current_user.balance
      flash[:bet_message] = "You don't have enough to place that bet"
      false
    else
      true
    end
  end

end
