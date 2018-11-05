class ChatsController < ApplicationController
  before_action :authenticate_user!
  def show
   @messages = Message.all
	p @messages
  end
  def create
  
  end
end
