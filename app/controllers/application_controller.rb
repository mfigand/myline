class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_filter :verify_authenticity_token, :only => [:index, :show]
  
  def after_sign_in_path_for(resource)
    if user_signed_in?
      user_path(current_user.id)
   end
 end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    end
end
