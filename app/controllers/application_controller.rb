class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :require_login

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthday])
  end

  private

  def require_login
    unless user_signed_in?
      flash[:notice] = 'You must sign in first'
      redirect_to root_path
    end
  end
end
