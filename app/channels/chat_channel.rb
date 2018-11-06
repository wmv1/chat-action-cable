class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def speak (data)
       Message.create!(content: data['message'], user: current_user,
                       secondary_user: data["user"])
  end
end
