class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      ActionCable.server.broadcast "messages",  #this first argument is the name of the channel to which we are broadcasting
        message: message.content,   #this argument is data that will be sent through the channel as JSON (content and username)
        user: message.user.username

      # ActionCable.server.broadcast("messages", message:message.content, user:message.user.username)
      head :ok
    else
      redirect_to chatrooms_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end

end
