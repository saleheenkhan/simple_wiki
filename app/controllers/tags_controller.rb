class TagsController < ApplicationController
  before_action :set_categories, only: [:index, :show]
  before_action :set_tags, only: [:index, :show]
  before_action :disallow_user, only: [:create]

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

  def set_categories
    @categories = Category.order('name asc')
  end

  def set_tags
    @tags = Tag.order('name asc')
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
