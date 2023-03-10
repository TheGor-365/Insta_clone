module PostsHelper

  def post_liked_by_user? post_id
    Like.where(post_id: post_id, person_id: current_person.id).any?
  end

end
