class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
  end

  def receive(payload)
    Message.create(user_id: payload["user_id"], chatroom_id: payload["chatroom_id"], content: payload["message"])
  end
end
