class CompetitorsController < ApplicationController

  before_action :require_login

  def index
    @competitors = Competitor.all.order(:name)
    @chart1 = AllCompetitorAnalytics.new.num_of_matchups_per_competitor
    @chart2 = AllCompetitorAnalytics.new.total_number_of_bets
    @chart3 = AllCompetitorAnalytics.new.total_value_of_bets
    @chart4 = AllCompetitorAnalytics.new.average_bet
    @chart5 = AllCompetitorAnalytics.new.total_wins_for_competitors
  end

  def new
    @competitor = Competitor.new
  end

  def create
    @competitor = Competitor.create(name: params[:competitor][:name])
    redirect_to @competitor
  end

  def show
    @competitor = Competitor.find(params[:id])
    @total_amount_of_bets_placed = IndividualCompetitorAnalytics.new(@competitor).chart_total_bets_amount
    @bets_per_competitor = IndividualCompetitorAnalytics.new(@competitor).chart_bets_per_competitor
  end

  def destroy
    @competitor = Competitor.find(params[:id])
    @competitor.destroy
    redirect_to competitors_path
  end

end
