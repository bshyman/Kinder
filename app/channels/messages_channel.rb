class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages_#{params[:chat_id]}"
    #how do we stream from messages specific to the chat
  end
end
