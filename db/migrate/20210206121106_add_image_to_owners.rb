class AddImageToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :image, :string
    add_column :owners, :description, :text
    add_column :owners, :website, :string
  end
end
