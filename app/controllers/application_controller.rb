class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  devise_group :member, contains: [:admin, :user]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
