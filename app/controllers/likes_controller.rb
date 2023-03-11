class LikesController < ApplicationController
  before_action :authenticate_owner!

  def save_like
    @like = Like.new(article_id: params[:article_id], owner_id: current_owner.id)
    @article_id = params[:article_id]
    existing_like = Like.where(article_id: params[:article_id], owner_id: current_owner.id)

    respond_to do |format|
      format.js {
        if existing_like.any?
          # like already exists for article by this user
          existing_like.first.destroy
          @success = false
        elsif @like.save
          @success = true
        else
          @success = false
        end

        @article_likes = Article.find(@article_id).total_likes_count
        render "articles/like"
      }
    end
  end

end
