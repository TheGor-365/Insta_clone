class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :person
      t.references :post

      t.timestamps
    end
  end
end
