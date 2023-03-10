class AddUsernameToPersons < ActiveRecord::Migration[6.0]
  def change
    add_column :persons, :username,   :string, limit: 20
    add_column :persons, :first_name, :string, limit: 20
    add_column :persons, :last_name,  :string, limit: 20
  end
end
