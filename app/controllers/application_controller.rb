class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  #def require_user
  #  if not user_signed_in?
  #    flash[:alert] = "You must be logged in"
  #    redirect_to new_user_session_path
  #  end
  #end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number])
  end
end
