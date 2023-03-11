class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :follower, references: :owners
      t.references :following, references: :owners

      t.timestamps
    end
  end
end
