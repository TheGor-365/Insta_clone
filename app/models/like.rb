class Like < ApplicationRecord
  belongs_to :letter
  belongs_to :owner
  validates_uniqueness_of :letter_id, scope: :owner_id

  after_create :increase_letter_like_counter
  after_destroy :decrease_letter_like_counter

  private

  def increase_letter_like_counter
    Letter.find(self.letter_id).increment(:total_likes_count).save
  end

  def decrease_letter_like_counter
    Letter.find(self.letter_id).decrement(:total_likes_count).save
  end

end
