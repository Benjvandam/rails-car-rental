class AddUsersToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :user1_id, :bigint, references: :users, foreign_key: true
    add_column :chatrooms, :user2_id, :bigint, references: :users, foreign_key: true
  end
end
