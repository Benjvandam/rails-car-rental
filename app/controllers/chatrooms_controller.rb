class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: %i[show]

  def show
    @message = Message.new
  end

  def index
  end

  def create

    user_id = current_user.id
    other_user_id = User.find(params[:user][:user_id]).id

    # Find a chatroom where the users match in either order
    @chatroom = Chatroom.find_by(
      "(user1_id = ? AND user2_id = ?) OR (user1_id = ? AND user2_id = ?)",
      user_id, other_user_id, other_user_id, user_id
    )

    if @chatroom
      chatroom_exist = true
    else
      chatroom_exist = false
    end

    unless chatroom_exist
      @chatroom = Chatroom.new
      @chatroom.user1_id = current_user.id
      @chatroom.user2_id = User.find(params[:user][:user_id]).id
    end

    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_chatroom
    unless Chatroom.all.empty?
      @chatroom = Chatroom.find(params[:id])
    end
  end
end
