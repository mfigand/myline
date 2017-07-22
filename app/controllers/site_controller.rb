class SiteController < ApplicationController

  def home
    check_log_session
  end

  def users_home
    check_log_session
  end


  private

  def check_log_session
    if user_signed_in?
      redirect_to user_path(current_user)
    end

  end

end
