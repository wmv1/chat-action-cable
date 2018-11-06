class RoomsController < ApplicationController
    def create
        @chat_room = ChatRoom.create
        Room.create(user: current_user, chat_room: @chat_room)
        @room = Room.create(user: params['user'], chat_room: @chat_room)
        redirect_to  user_rooms_path
    end
    def index
        @user = params['user_id']
        @messages = Message.where("user_id = ?
                                   and secondary_user = ?
                                   or user_id = ? 
                                   and secondary_user = ?", 
                                   current_user, 
                                   @user, 
                                   @user, 
                                   current_user)
   end
end
