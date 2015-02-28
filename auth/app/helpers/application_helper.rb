module ApplicationHelper

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def log_in(user)
    session[:user_id] = user.id
  end

end
