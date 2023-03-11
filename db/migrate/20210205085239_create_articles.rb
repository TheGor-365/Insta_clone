class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string    :image
      t.boolean   :active
      t.references :owner

      t.timestamps
    end
  end
end
