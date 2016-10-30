class MatchupTypesController < ApplicationController

  def index
    @matchup_types = MatchupType.all
  end

  def new
    @matchup_type = MatchupType.new
  end

  def create
    @matchup_type = MatchupType.create(name: params[:matchup_type][:name])
    redirect_to @matchup_type
  end

  def show
    @matchup_type = MatchupType.find(params[:id])
  end

  def destroy
    @matchup_type = MatchupType.find(params[:id])
    @matchup_type.destroy
    redirect_to matchup_types_path
  end

end
