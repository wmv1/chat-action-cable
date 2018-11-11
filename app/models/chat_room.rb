class ChatRoom < ApplicationRecord
  has_many :user
  has_many :user, through: :room
end
