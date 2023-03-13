class CreateLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :letters do |t|
      t.string    :image
      t.boolean   :active
      t.references :owner

      t.timestamps
    end
  end
end
