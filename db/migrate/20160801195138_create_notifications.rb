class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :comment_id
      t.boolean :read
      t.integer :conversation_id
      t.integer :message_id

      t.timestamps null: false
    end
  end
end
