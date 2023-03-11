class AddUsernameToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :username,   :string, limit: 20
    add_column :owners, :first_name, :string, limit: 20
    add_column :owners, :last_name,  :string, limit: 20
  end
end
