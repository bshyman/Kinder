require 'securerandom'

class ChatsController < ApplicationController
  def index
    @chats = current_user.chats
    @chat = Chat.new
  end

   def create
    friend_user = User.find(params[:friend])
    @chat = find_chat(friend_user) || Chat.new(identifier: SecureRandom.hex)
    if !@chat.persisted?
      @chat.save
      @chat.subscriptions.create(user_id: current.id)
      @chat.subscriptions.create(user_id: friend_user.id)
      respond_to do |format|
        format.html { redirect_to user_chat_path(current_user,@chat) }
        format.js
      end
    else
      redirect_to user_chat_path(current_user,@chat)
    end
  end

  def find_chat(second_user)
    chats = current_user.chats
    chats.each do |chat|
      chat.subscriptions.each do |s|
        if s.user_id == second_user.id
          return chat
        end
      end
    end
    nil
  end

  def show
    @chat = Chat.find_by(id: params[:id])
    @message = Message.new
  end

   private

    # def chat_params
    #   params.require(:chat).permit(:identifier)
    # end
end

