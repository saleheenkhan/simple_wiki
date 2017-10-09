class UserAdminController < ApplicationController
  before_action :set_user, only: [:edit, :update, :enable, :disable]
  before_action :set_categories, :set_tags
  before_action :disallow_user
  before_action :disallow_editor

  def index
    @users = User.order("full_name asc")
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_admin_index_path, notice: "User #{@user.full_name} has been created"
    else
      redirect_to user_admin_index_path, notice: "User could not be created"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_admin_index_path, notice: "User #{@user.full_name} has been updated"
    else
      redirect_to user_admin_index_path, notice: "User #{@user.full_name} could not be saved"
    end
  end

  def disable
    password = Devise.friendly_token.first(8)
    @user.role = "Disabled"
    @user.password = password
    @user.password_confirmation = password
    @user.save
    redirect_to user_admin_index_path, notice: "User #{@user.full_name} has been disabled"
  end

private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_categories
    @categories = Category.order('name asc')
  end

  def set_tags
    @tags = Tag.order('name asc')
  end
end
