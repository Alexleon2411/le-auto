class ApplicationController < ActionController::Base
  before_action :authenticate_user!
<<<<<<< HEAD

=======
  before_action :configure_permitted_parameters, if: :devise_controller?
>>>>>>> master
  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo])
  end
end
