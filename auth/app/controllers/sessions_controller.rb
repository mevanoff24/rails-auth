class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged In"
    else
      flash.now.alert = "Email or passowrd incorrect"
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to root_url, notice: "Loged Out"
  end
end
