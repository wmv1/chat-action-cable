class MessageController < ApplicationController
    def destroy
     @msg = Message.find(params[:id])
     @user = @msg.secondary_user
     @msg.destroy

     redirect_to user_rooms_path(@user)    
    end
end
