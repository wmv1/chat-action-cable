class User < ApplicationRecord
  has_many :messages
  has_many :chat_rooms	
  has_many :chat_rooms, through: :room	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def appear
    self.online = true   
    self.save!
  end
  def disappear
   self.online = false
   self.save!
  end
  
  def online?
   if self.online
      "online"
   else
      "offline"
   end
  end
end
