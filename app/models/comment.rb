class Comment < ApplicationRecord

  belongs_to :article
  belongs_to :owner

  validates_presence_of :comment
  validates_presence_of :owner_id
  validates_presence_of :article_id

  attr_accessor :return_to

  after_create :increase_article_comment_counter
  after_destroy :decrease_article_comment_counter

  private

  def increase_article_comment_counter
    Article.find(self.article_id).increment(:total_comments_count).save
  end

  def decrease_article_comment_counter
    Article.find(self.article_id).decrement(:total_comments_count).save
  end

end
