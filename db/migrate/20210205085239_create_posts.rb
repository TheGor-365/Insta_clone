class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string    :image
      t.boolean   :active
      t.references :accout

      t.timestamps
    end
  end
end
