class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    if current_user.avatar?
        image = current_user.avatar.url
      else
        image = "/assets/kinder-icon-circle-6ee0d923b9d72213cf4c5b5b807a6cf2697e4c71dac15afe4d16104cacc7d027.png"
    end
    if message.save
      ActionCable.server.broadcast( "messages_#{message_params[:chat_id]}",
      #broadcasting out to messages channel, which all chats are linked to messages channel
      message: message.content,
      user: image,
      username: message.user.first_name
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
