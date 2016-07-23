class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast_to( "messages_#{message_params[:chat_id]}",
      #broadcasting out to messages channel, which all chats are linked to messages channel
      message: message.content,
      user: message.user.username,
      head :ok
      )
    else
      redirect_to chats_path
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chat_id)
    end
end
