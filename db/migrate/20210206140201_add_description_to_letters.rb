class AddDescriptionToLetters < ActiveRecord::Migration[6.0]
  def change
    add_column :letters, :description, :text
  end
end
