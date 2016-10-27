class MatchupsController < ApplicationController

  def new
    @matchup = Matchup.new
    @competitors = Competitor.all
    @types = MatchupType.all
  end

  def index
    @matchups = Matchup.all
  end

  def create
    @matchup = Matchup.new

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
