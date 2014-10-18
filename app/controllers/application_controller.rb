class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in_or_redirect
    if !user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
