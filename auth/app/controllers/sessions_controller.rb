class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_url, notice: "Logged In"
    else
      flash.now.alert = "Email or passowrd incorrect"
      render "new"
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
