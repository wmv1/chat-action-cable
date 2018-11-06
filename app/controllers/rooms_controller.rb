class RoomsController < ApplicationController
    def create
        @chat_room = ChatRoom.create
        Room.create(user: current_user, chat_room: @chat_room)
        @room = Room.create(user: params['user'], chat_room: @chat_room)
        redirect_to  user_rooms_path
    end
    def index
        @messages = Message.all
   end
end
