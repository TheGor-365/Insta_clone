class Comment < ApplicationRecord
  belongs_to :letter
  belongs_to :owner

  validates_presence_of :comment
  validates_presence_of :owner_id
  validates_presence_of :letter_id

  attr_accessor :return_to

  after_create :increase_letter_comment_counter
  after_destroy :decrease_letter_comment_counter

  private

  def increase_letter_comment_counter
    Letter.find(self.letter_id).increment(:total_comments_count).save
  end

  def decrease_letter_comment_counter
    Letter.find(self.letter_id).decrement(:total_comments_count).save
  end
end
