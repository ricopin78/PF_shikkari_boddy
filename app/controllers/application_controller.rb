class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    events_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :company, :profile_image])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :company, :profile_image])
  end

end