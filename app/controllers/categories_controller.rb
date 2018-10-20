class CategoriesController < ApplicationController
  before_action :require_logged_in
  before_action :require_admin, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def edit
    find_category
  end

  def update
    @category.update(category_params)
      if @category.valid?
        @category.save
        redirect_to categories_path
      else
        render :edit
      end
  end

  def destroy
    category = Category.find_by(:id => params[:id])
    article = Article.find_by(:category_id => params[:id]) if category
    if category && !article
        category.destroy
    else
        flash[:alert] ="Error. Verify Topic does not have any Articles."
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find_by(:id => params[:id])
  end
end
