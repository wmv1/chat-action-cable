#Responsãovel por receber a mensagem da view

class ChatChannel < ApplicationCable::Channel
  def subscribed
    current_user.appear
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_user.disappear
  end
  def speak (data)
       p "ChatChannel***********"
       Message.create!(content: data['message'], user: current_user,
                       secondary_user: data["user"])
  end
  def falar (data)
       p "ChatChannel- Falar***********"
       Message.create!(content: data['message'], user: current_user,
                       secondary_user: data["user"])
  end

end
