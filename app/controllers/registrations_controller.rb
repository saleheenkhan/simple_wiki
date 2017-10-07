class RegistrationsController < Devise::RegistrationsController

  def new
    redirect_to root_path, notice: 'Registrations have been disabled, please contact your administrator for access'
  end

  def create
    redirect_to root_path, notice: 'Registrations have been disabled, please contact your administrator for access'
  end
end
