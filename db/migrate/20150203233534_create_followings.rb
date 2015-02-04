class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references :user, index: true
      t.integer :follower_id

      t.timestamps null: false
    end
    add_foreign_key :followings, :users
  end
end
