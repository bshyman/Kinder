require 'securerandom'

class ChatsController < ApplicationController
  def index
    @chats = current_user.chats
    @chat = Chat.new
  end

   def create
    @friend = User.find(params[:friend])
    @chat = find_chat(@friend) || Chat.new(identifier: SecureRandom.hex)
    if !@chat.persisted?
      @chat.save
      @chat.subscriptions.create(user_id: current_user.id)
      @chat.subscriptions.create(user_id: @friend.id)
      respond_to do |format|
        format.html { redirect_to user_chat_path(current_user, @chat,  :friend => @friend.id) }
        format.js
      end
    else
      redirect_to user_chat_path(current_user,@chat, :friend => @friend.id)
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
    @friend = User.find(params[:friend])

    @chat = Chat.find_by(id: params[:id])
    @message = Message.new
    recieved_msgs = @chat.messages.where.not(user_id: current_user.id)
    recieved_msgs.each {|msg| msg.update(seen: true)}
  end

   private

    # def chat_params
    #   params.require(:chat).permit(:identifier)
    # end
end
