jQuery(document).on 'turbolinks:load', ->
  chatmessages = $('#chatmessages')
  if $('#chatmessages').length > 0
    chatmessages_to_bottom = -> chatmessages.scrollTop(chatmessages.prop("scrollHeight"))

    chatmessages_to_bottom()

  App.global_chat = App.cable.subscriptions.create {
    channel: "ChatRoomsChannel"
    chat_room_id: messages.data('chat-room-id')
    },
     connected: ->

     disconnected: ->

     received: (data) ->
      chatmessages.append data['message']
      chatmessages_to_bottom()

send_message: (chatmessage, chat_room_id) ->
  @perform 'send_message', chatmessage: chatmessage, chat_room_id: chat_room_id
  # may need to change message: to chatmessage:

$('#new_chatmessage').submit (e) ->
  $this = $(this)
  textarea = $this.find('#chatmessage_body')
    if $.trim(textarea.val()).length > 1
      App.global_chat.send_chatmessage textarea.val(), chatmessages.data('chat-room-id')
      textarea.val('')
      e.preventDefault()
      return false
