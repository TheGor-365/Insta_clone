class LettersController < ApplicationController
  before_action :authenticate_owner!
  before_action :set_letter, only: [:show]

  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.new(letter_params)
    @letter.owner_id = current_owner.id if owner_signed_in?

    if @letter.save
      redirect_to dashboard_path, flash: { success: 'Letter was created successfully' }
    else
      redirect_to new_letter_path, flash: { danger: 'Letter was not saved' }
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.includes(:owner).where(letter_id: @letter.id)
  end

  private

  def set_letter
    @letter = Letter.find(params[:id]) if params[:id].present?
  end

  def letter_params
    params.require(:letter).permit(:image, :image_cache, :description)
  end
end
