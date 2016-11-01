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
      @chart1 = total_bets_all_users
    end
  end

  def show
    @bets = winning_bets_leaders
    @chart2 = total_winning_bets_all_users
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

  def total_bets_all_users
    bets = Bet.find_by_sql("SELECT user_id, count(*) as count FROM bets JOIN users ON bets.user_id = users.id GROUP BY bets.user_id")
    bets.map {|bet| [bet.user.username, bet.count]}
  end

  def total_winning_bets_all_users
    bets = Bet.find_by_sql("SELECT user_id, count(*) as count FROM bets JOIN matchups_competitors ON bets.matchups_competitor_id = matchups_competitors.id JOIN users ON bets.user_id = users.id WHERE matchups_competitors.winner = true GROUP BY bets.user_id ORDER BY count DESC")
    bets.map {|bet| [bet.user.username, bet.count]}
  end

  def winning_bets_leaders
    # should find a way to make these find by UNIQUE matchups to prevent spamming
    # small bets to rack up "wins"
    Bet.find_by_sql("SELECT user_id, count(*) as count FROM bets JOIN matchups_competitors ON bets.matchups_competitor_id = matchups_competitors.id JOIN users ON bets.user_id = users.id WHERE matchups_competitors.winner = true GROUP BY bets.user_id ORDER BY count DESC")
  end

end
