class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :letter
      t.references :owner
      t.string :comment

      t.timestamps
    end
  end
end
