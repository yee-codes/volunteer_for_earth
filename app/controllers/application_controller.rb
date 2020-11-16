class ApplicationController < ActionController::Base
  # To prevent CSRF
  protect_from_forgery with: :exception

  # Get devise to authenticate user before displaying the URL
  before_action :authenticate_user!

  # For authentication and authorisation
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:first_name, :last_name, :username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
