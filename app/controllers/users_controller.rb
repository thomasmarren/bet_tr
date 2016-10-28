class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :username, :password))
    if params[:user][:password] == params[:user][:password_confirmation]
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        #name exists, username exists, or username already taken
        render :new
      end
    else
      flash[:passwords] = "Passwords must match."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def placebet
    binding.pry
  end


private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
