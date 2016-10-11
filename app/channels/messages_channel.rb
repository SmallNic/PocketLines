class MessagesChannel < ApplicationCable::Channel

  # After creating this channel we will need to instruct the appropriate parts of the application to broadcast to and stream from this channel.

  def subscribed
    # This method is responsible for subscribing to and streaming mesages that are broadcast to this channel
    stream_from 'messages'
  end

end
