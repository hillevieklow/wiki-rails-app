class ArticlesController < ApplicationController
  before_action :require_logged_in

  def index
    @articles = Article.all.order("created_at DESC")
  end

  def show
    find_article
  end

  def new
    @article = Article.new()
  end

  def create
    @article = Article.create(article_params)
    if @article.valid?
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
