class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!


  def admin?
    user_signed_in? && current_user.role == "Admin"
  end

  def editor?
    user_signed_in? && current_user.role == "Editor"
  end

  def disabled?
    user_signed_in? && current_user.role == "Disabled"
  end

  def user?
    user_signed_in? && current_user.role == "User"
  end

  def disallow_user
    if user?
      flash[:notice] = 'You are not authorized to access this resource'
      redirect_to root_path
    end
  end

  def disallow_editor
    if editor?
      flash[:notice] = 'You are not authorized to access this resource'
      redirect_to root_path
    end
  end

  helper_method :admin?, :editor?, :disable?, :user?

  def after_sign_in_path_for(resource)
    case resource.role
      when "Admin"
      root_path
      when "Editor"
      root_path
      when "User"
      root_path
      when "Disabled"
      destroy_user_session_path
    end
  end


protected

  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_confirmation, :remember_me, :role]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
