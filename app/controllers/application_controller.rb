class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # check_authorization :unless => :devise_controller?
  # Can Can Can validations
  # skip_before_filter :verify_authenticity_token, :only => [:index, :show]
  check_authorization :unless => :do_not_check_authorization?

  def after_sign_in_path_for(resource)
    if user_signed_in?
      user_path(current_user.id)
   end
 end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end

    def do_not_check_authorization?
    respond_to?(:devise_controller?)
  end
end
