module LettersHelper

  def letter_liked_by_user? letter_id
    Like.where(letter_id: letter_id, owner_id: current_owner.id).any?
  end

end
