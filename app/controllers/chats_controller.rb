class ChatsController < ApplicationController
  def show
   @messages = Message.all
	p @messages
  end
end
