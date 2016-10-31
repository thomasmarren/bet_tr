class CompetitorsController < ApplicationController

  before_action :require_login

  def index
    @competitors = Competitor.all
    mc = MatchupsCompetitor.find_by_sql(
    <<-SQL
    SELECT competitor_id, count(*) AS count
    FROM matchups_competitors
    GROUP BY matchups_competitors.competitor_id
    SQL
    )
    @chart = mc.map do |mc|
      [Competitor.find(mc.competitor_id).name, mc.count]
    end
  end

  def new
    @competitor = Competitor.new
  end

  def create
    @competitor = Competitor.create(name: params[:competitor][:name].upcase)
    redirect_to @competitor
  end

  def show
    @competitor = Competitor.find(params[:id])
  end

  def destroy
    @competitor = Competitor.find(params[:id])
    @competitor.destroy
    redirect_to competitors_path
  end


end
