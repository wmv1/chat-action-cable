#Responsável por criar os jobs de forma sincrona 
class ChatBroadcastJob < ApplicationJob
  queue_as :default
  def perform(message)
    #Realiza o broad cast para todos que estão ustilizando o chat_channel
    ActionCable.server.broadcast 'chat_channel', message: render_message(message)
  end
 
  private
  def render_message(message)
      #ApplicationController.renderer.render(partial: '../views/messages/messages', locals: { message: message })  
      #Renderiza a view sempre que uma mensagem é recebida de um usuário
      ApplicationController.render_with_signed_in_user(message.user, partial: '../views/messages/messages', locals: { message: message })
  end
end
