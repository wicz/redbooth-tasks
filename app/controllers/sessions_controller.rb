# encoding: utf-8

class SessionsController < ApplicationController
  def create
    user = User.build_from_auth_hash(auth_hash)

    if user.valid?
      session[:user] = user

      redirect_to(tasks_path)
    else
      flash[:error] = "Could not sign in."

      redirect_to(root_path)
    end
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end

