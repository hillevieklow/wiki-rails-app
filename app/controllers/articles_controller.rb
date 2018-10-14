class ArticlesController < ApplicationController
  before_action :require_logged_in

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def show
    find_article
  end

  def new
    @article = current_user.articles.build
  end

  def edit
    find_article
  end

  def update
    find_article
    @article.update(article_params)
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render :edit
    end
  end

  def create
    @article = current_user.articles.build(article_params)
    # byebug
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def destroy
    find_article
    @article.destroy
    redirect_to user_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
