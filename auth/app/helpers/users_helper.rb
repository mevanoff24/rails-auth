module UsersHelper

   def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

end
