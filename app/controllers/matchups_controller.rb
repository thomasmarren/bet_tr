class MatchupsController < ApplicationController

  def new
    @competitors = Competitor.all
    @types = MatchupType.all
    @matchup = Matchup.new
  end

  def index
    @matchups = Matchup.all
  end

  def create
    if same_competitors? #|| !valid_date?
      redirect_to new_matchup_path
    else
      #@matchup = Matchup.new
    end
    #@matchup = Matchup.new

  end

  def show
    @competitor = Competitor.find(params[:id])
  end

  def destroy
    @competitor = Competitor.find(params[:id])
    @competitor.destroy
    redirect_to competitors_path
  end

  private

  def competitor1
    params[:competitor1]
  end

  def competitor2
    params[:competitor2]
  end

  # def valid_date?
  #
  #   if @deadline && @deadline > DateTime.now
  #     return true
  #   else
  #     flash[:date] = "You've entered invalid date!"
  #   end
  #
  # end

  def same_competitors?
    if competitor1 == competitor2
      flash[:failed_creation] = "You cannot pick the same competitor for a matchup."
    end
  end


end
