class TagsController < ApplicationController
  before_action :disallow_user, only: [:create]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tags = Tag.order("name asc")
  end

  def show
    @tag = Tag.friendly.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag
    else
      render json: {errors: @tag.errors.full_messages}
    end
  end

private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
