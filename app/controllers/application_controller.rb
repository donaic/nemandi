class ApplicationController < ActionController::Base
  #before_action :configure_devise_parameters, if: :devise_controller?
  before_action :authenticate_credential!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  protected
    # Configure strong parameters for new User
    #def configure_devise_parameters
    #  devise_parameter_sanitizer.for(:sign_up) << :first_name

    #  devise_parameter_sanitizer.for(:account_update) <<
    #    permit(:email, :password, :password_confirmation, :first_name, :middle_name, :last_name)

    #end

    helper_method :current_user
    def current_user
      current_credential.user
    end
end
