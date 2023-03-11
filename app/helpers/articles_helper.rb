module ArticlesHelper

  def article_liked_by_user? article_id
    Like.where(article_id: article_id, owner_id: current_owner.id).any?
  end

end
