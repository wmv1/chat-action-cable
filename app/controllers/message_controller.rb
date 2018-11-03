class MessageController < ApplicationController
    def destroy
     @msg = Message.find(params[:id])
     @msg.destroy

     redirect_to root_path    
    end
end