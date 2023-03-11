class CommentsController < ApplicationController
  before_action :authenticate_owner!

  def create
    @comment = Comment.new(comment_params)
    @comment.owner_id = current_owner.id if owner_signed_in?

    if @comment.save
      return_url = params[:comment][:return_to].present? ? article_path(@comment.article_id) : dashboard_path

      redirect_to return_url, flash: { success: 'Comment was created successfully' }
    else
      redirect_to dashboard_path, flash: { danger: 'Comment was not saved' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :article_id, :return_to)
  end

end
