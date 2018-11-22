class JsonController < ApplicationController
    def list_all_json
     @users = User.all
     @us = []
     @users.each do |u|
      user = Hash.new
      user['id']=u.id
      user['name']=u.name
      user['online']=u.online
      user['current_user_id']=current_user.id
      @us.push(user)
     end 
     render json: @us
   end
 
end
