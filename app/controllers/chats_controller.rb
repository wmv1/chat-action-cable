class ChatsController < ApplicationController
  before_action :authenticate_user!
  def show
   @messages = Message.all
  end
  def create
  
  end
end
