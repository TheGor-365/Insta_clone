class AddTotalLikesCount < ActiveRecord::Migration[6.0]
  def change
    add_column :letters, :total_likes_count, :integer
    add_column :letters, :total_comments_count, :integer
  end
end
