class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
<<<<<<< HEAD

=======
>>>>>>> 3fe99aa7a2be7f44ef188cea374068aa4de2eb09
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo])
  end
end
