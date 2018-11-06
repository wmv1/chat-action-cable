class ChatBroadcastJob < ApplicationJob
  queue_as :default
 
  def perform(message)
    ActionCable.server.broadcast 'chat_channel', message: render_message(message)
  end
 
  private
  def render_message(message)
    unless message.user == current_user || message.secondary_user == current_user.id
      ApplicationController.renderer.render(partial: '../views/messages/messages', locals: { message: message, test: "teste" })  
    end
    
  end
end
