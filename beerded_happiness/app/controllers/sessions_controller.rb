class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
  end

  def destroy
    session.clear
    redirect_to '/login'
  end

end
