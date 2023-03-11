class AddTotalLikesCount < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :total_likes_count, :integer
    add_column :articles, :total_comments_count, :integer
  end
end
