class Like < ApplicationRecord
  belongs_to :article
  belongs_to :owner
  validates_uniqueness_of :article_id, scope: :owner_id

  after_create :increase_article_like_counter
  after_destroy :decrease_article_like_counter

  private

  def increase_article_like_counter
    Article.find(self.article_id).increment(:total_likes_count).save
  end

  def decrease_article_like_counter
    Article.find(self.article_id).decrement(:total_likes_count).save
  end

end
