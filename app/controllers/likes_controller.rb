class LikesController < ApplicationController
  before_action :authenticate_owner!

  def save_like
    @like = Like.new(letter_id: params[:letter_id], owner_id: current_owner.id)
    @letter_id = params[:letter_id]
    existing_like = Like.where(letter_id: params[:letter_id], owner_id: current_owner.id)

    respond_to do |format|
      format.js {
        if existing_like.any?
          # like already exists for letter by this user
          existing_like.first.destroy
          @success = false
        elsif @like.save
          @success = true
        else
          @success = false
        end

        @letter_likes = Letter.find(@letter_id).total_likes_count
        render "letters/like"
      }
    end
  end

end
