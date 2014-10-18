class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to new_poll_centre_path
    end
  end
end
