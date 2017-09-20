class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chatmessage)
    ActionCable.server.broadcast "chat_rooms_#{chatmessage.chat_room.id}_channel",
                                 chatmessage: 'MESSAGE_HTML'
  end

  private

  def render_chatmessage(chatmessage)
    MessagesController.render partial: 'messages/message', locals: { chatmessage: chatmessage }
  end
end
