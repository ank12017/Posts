class ApplicationController < ActionController::Base
	  before_action :authenticate_user!
  protect_from_forgery with: :exception

  # before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	 added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
  
  	devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username, :email, :password, :password_confirmation, :current_password)}end
  
end
