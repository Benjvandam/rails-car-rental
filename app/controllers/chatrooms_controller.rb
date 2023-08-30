class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show]

  def show
    @message = Message.new
  end

  def index
  end

  def create

    # sender = current_user
    # receiver = User.find(params[:user][:user_id])

    # senderChatroomExists = false
    # receiverChatroomExists = false

    # chatrooms = Chatroom.all
    # chatrooms.each do |chatroom|
    #   chatroom.messages.each do |message|
    #     if message.user == sender
    #       senderChatroomExists = true
    #     elsif message.user == receiver
    #       receiverChatroomExists = true
    #     end
    #   end

    #   if senderChatroomExists && receiverChatroomExists
    #     @chatroom = chatroom
    #   else
    #     senderChatroomExists = false
    #     receiverChatroomExists = false
    #   end
    # end

    # if @chatroom == nil
    #   @chatroom = Chatroom.new
    #   if @chatroom.save
    #     redirect_to chatroom_path(@chatroom)
    #   else
    #     render :index, status: :unprocessable_entity
    #   end
    # else
    #   redirect_to chatroom_path(@chatroom)
    # end
  end

  private

  def set_chatroom
    unless Chatroom.all.empty?
      @chatroom = Chatroom.find(params[:id])
    end
  end
end
