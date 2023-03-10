class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :follower, references: :persons
      t.references :following, references: :persons

      t.timestamps
    end
  end
end
