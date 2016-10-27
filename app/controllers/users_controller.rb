class UsersController < ApplicationController

  before_action :logged_in?, except: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:password] == params[:password_confirmation]
      @user = User.new(user_params(:name, :username, :password))
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        #name exists, username exists, or username already taken
        render :new
      end
    else
      #passwords don't match
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


private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
