# encoding: utf-8

module SessionsHelper
  def authenticate_user!
    unless user_signed_in?
      flash[:error] = "Access denied. Please sign in to continue."
      redirect_to(root_path) and return
    end
  end

  def user_signed_in?
    !!current_user
  end

  def current_user
    session[:user]
  end
end

