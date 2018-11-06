class ChatBroadcastJob < ApplicationJob
  queue_as :default
  def perform(message)
    ActionCable.server.broadcast 'chat_channel', message: render_message(message)
  end
 
  private
  def render_message(message)
      ApplicationController.renderer.render(partial: '../views/messages/messages', locals: { message: message })  
  end
end
