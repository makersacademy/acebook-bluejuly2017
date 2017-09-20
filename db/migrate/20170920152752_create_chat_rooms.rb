class CreateChatRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.references :chatuser, foreign_key: true

      t.timestamps
    end
  end
end
