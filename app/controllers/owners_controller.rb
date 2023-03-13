class OwnersController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_owner, only: [:profile]

  def index
    followers_ids = Follower.where(follower_id: current_owner.id).map(&:following_id)
    followers_ids << current_owner.id

    @letters = Letter.active
    @comment = Comment.new

    following_ids = Follower.where(follower_id: current_owner.id).map(&:following_id)
    following_ids << current_owner.id

    @follower_suggestions = Owner.where.not(id: following_ids)
  end

  def profile
    @letters = @owner.letters.active
  end

  def follow_owner
    follower_id = params[:follow_id]

    if Follower.create!(follower_id: current_owner.id, following_id: follower_id)
      flash[:success] = 'Now following user'
    else
      flash[:danger] = 'Unable add follower'
    end

    redirect_to dashboard_path
  end

  private

  def set_owner
    @owner = Owner.find_by_username(params[:username])
  end
end
