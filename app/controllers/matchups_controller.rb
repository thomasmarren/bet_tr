class MatchupsController < ApplicationController

  before_action :require_login, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @matchups = Matchup.all
    @matchups_open = Matchup.where("deadline > ?", Time.now).order(:deadline)
    @matchups_closed = Matchup.where("deadline < ?", Time.now).order(deadline: :desc)
  end

  def new
    @competitors = Competitor.all.order(:name)
    @types = MatchupType.all
    @matchup = Matchup.new
  end

  def create
    @competitor1 = Competitor.find(competitor1)
    @competitor2 = Competitor.find(competitor2)
    competitors = [@competitor1, @competitor2]
    @matchup_type = MatchupType.find(matchup_type)
    if matchup_name == ""
      if @competitor1.id > @competitor2.id
        name = "#{@competitor2.name} VS #{@competitor1.name}"
      else
        name = "#{@competitor1.name} VS #{@competitor2.name}"
      end
    else
      name = matchup_name.upcase
    end

    if same_competitors?
      redirect_to new_matchup_path
    else
      @matchup = Matchup.new(name: name, deadline: deadline, matchup_type_id: @matchup_type.id)
      @matchup.competitors = competitors.sort_by {|comp| comp.id}
      @matchup.save
      redirect_to @matchup
    end
  end

  def show
    @matchup = Matchup.find(params[:id])
  end

  def edit
    @matchup = Matchup.find(params[:id])
  end

  def update
    matchup = Matchup.find(params[:matchup])
    if params[:random]
      matchup.random_winner
      redirect_to matchup
    else
    winner = Competitor.find(params[:competitor])
    matchup.set_winner(winner)
      redirect_to matchup
    end
  end

  def destroy
    @matchup = Matchup.find(params[:id])
    @matchup.destroy
    redirect_to matchups_path
  end

  def create_random_matchup
    @random_matchup = RandomMatchupGenerator.new.randomize
    @random_matchup.save
    redirect_to @random_matchup
  end

  def close_all
    Matchup.all.each do |matchup|
      if matchup.closeable?
        matchup.random_winner
      end
    end
    redirect_to matchups_path
  end

  private

  def matchup_name
    params[:matchup][:name]
  end

  def competitor1
    params[:competitor1]
  end

  def competitor2
    params[:competitor2]
  end

  def matchup_type
    params[:matchup_type]
  end

  def deadline
    params[:matchup][:deadline]
  end

  def same_competitors?
    if competitor1 == competitor2
      flash[:failed_creation] = "You cannot pick the same competitor for a matchup."
    end
  end

end
