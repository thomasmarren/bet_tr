class SessionsController < ApplicationController

  ADMIN_PASSWORD = "nohackers"

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def admin
  end

  def make_admin
    if params[:password] == ADMIN_PASSWORD
      session[:admin] = true
      redirect_to matchups_path
    else
      redirect_to user_path(current_user)
    end
  end


end
