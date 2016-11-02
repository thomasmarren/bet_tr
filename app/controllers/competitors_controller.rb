class CompetitorsController < ApplicationController

  before_action :require_login

  def index
    @competitors = Competitor.all.order(:name)
    @chart1 = AllCompetitorAnalytics.new.num_of_matchups_per_competitor
    @chart2 = AllCompetitorAnalytics.new.total_number_of_bets
    @chart3 = AllCompetitorAnalytics.new.total_value_of_bets
    @chart4 = AllCompetitorAnalytics.new.average_bet
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

#Moved to all_competitor_analytics.rb

  # def num_of_matchups_per_competitor
  #   mc = MatchupsCompetitor.find_by_sql(
  #   <<-SQL
  #   SELECT competitor_id, count(*) AS count
  #   FROM matchups_competitors
  #   GROUP BY matchups_competitors.competitor_id
  #   SQL
  #   )
  #   mc.map do |mc|
  #     [Competitor.find(mc.competitor_id).name, mc.count]
  #   end
  # end

  # def total_bets_all_competitors
  #   competitors = Competitor.find_by_sql(
  #   <<-SQL
  #   SELECT SUM(amount) AS bets, competitors.id, competitors.name
  #   FROM bets
  #   JOIN matchups_competitors
  #   ON bets.matchups_competitor_id = matchups_competitors.id
  #   JOIN competitors
  #   ON matchups_competitors.competitor_id = competitors.id
  #   GROUP BY competitors.id;
  #   SQL
  #   )
  # end

  # def total_number_of_bets
  #   competitors = total_bets_all_competitors
  #   competitors.map do |competitor|
  #     [competitor.name, competitor.bets.count]
  #   end
  # end

  # def total_value_of_bets
  #   competitors = total_bets_all_competitors
  #   competitors.map do |competitor|
  #     [competitor.name, competitor.bets.map(&:amount).inject {|sum,bet| sum + bet}]
  #   end
  # end
  #
  # def average_bet
  #   competitors = total_bets_all_competitors
  #   competitors.map do |competitor|
  #     [competitor.name, (competitor.bets.map(&:amount).inject {|sum,bet| sum + bet}) / (competitor.bets.count)]
  #   end
  # end

end
