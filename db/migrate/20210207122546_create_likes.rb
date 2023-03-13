class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :owner
      t.references :letter

      t.timestamps
    end
  end
end
