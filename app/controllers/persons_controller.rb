class PersonsController < ApplicationController
  before_action :authenticate_person!
  before_action :set_person, only: [:profile]

  def index
    # user dashboard - post feed
    followers_ids = Follower.where(follower_id: current_person.id).map(&:following_id)
    followers_ids << current_person.id

    @posts = Post.active
    @comment = Comment.new

    following_ids = Follower.where(follower_id: current_person.id).map(&:following_id)
    following_ids << current_person.id

    @follower_suggestions = Person.where.not(id: following_ids)
  end

  def profile
    # user person
    @posts = @person.posts.active
  end

  def follow_person
    follower_id = params[:follow_id]

    if Follower.create!(follower_id: current_person.id, following_id: follower_id)
      flash[:success] = 'Now following user'
    else
      flash[:danger] = 'Unable add follower'
    end

    redirect_to dashboard_path
  end

  private

  def set_person
    @person = Person.find_by_username(params[:username])
  end

end
