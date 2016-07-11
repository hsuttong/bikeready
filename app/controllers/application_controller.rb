class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:about, :contact]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session # Added to prevent rails form secuity

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:first_name,
                 :last_name,
                 :phone,
                 :email,
                 :password,
                 :password_confirmation)
    end
  end
end
