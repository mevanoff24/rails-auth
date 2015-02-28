class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

private

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
  # before_filter :authorize, only: [:edit, :update]
end
