class CreateChatmessages < ActiveRecord::Migration[5.1]
  def change
    create_table :chatmessages do |t|
      t.text :body
      t.references :chatuser, foreign_key: true
      t.references :chat_room, foreign_key: true

      t.timestamps
    end
  end
end
