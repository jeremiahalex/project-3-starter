class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
    ActionCable.server.broadcast "messages", {message: "<p><strong>#{current_user.name}</strong> has connected</p>", chatroom_id: params[:room]}
  end

  def unsubscribed
    ActionCable.server.broadcast "messages", {message: "<p><strong>#{current_user.name}</strong> has disconnected</p>", chatroom_id: params[:room]}
  end

  def receive(payload)
    if Chatroom.find(payload["chatroom_id"]).group.users.include? current_user
      Message.create(user: current_user, chatroom_id: payload["chatroom_id"], content: payload["message"])
    end
  end

end
