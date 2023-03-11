class ArticlesController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_article, only: [:show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.owner_id = current_owner.id if owner_signed_in?

    if @article.save
      redirect_to dashboard_path, flash: { success: 'Article was created successfully' }
    else
      redirect_to new_article_path, flash: { danger: 'Article was not saved' }
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.includes(:owner).where(article_id: @article.id)
  end

  private

  def set_article
    @article = Article.find(params[:id]) if params[:id].present?
  end

  def article_params
    params.require(:article).permit(:image, :image_cache, :description)
  end

end
