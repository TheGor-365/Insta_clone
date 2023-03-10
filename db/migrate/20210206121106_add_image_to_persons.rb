class AddImageToPersons < ActiveRecord::Migration[6.0]
  def change
    add_column :persons, :image, :string
    add_column :persons, :description, :text
    add_column :persons, :website, :string
  end
end
