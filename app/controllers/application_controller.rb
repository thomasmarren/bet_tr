class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    redirect_to login_path if session[:user_id].nil?
  end

end
