class ChatRoom < ApplicationRecord
  belongs_to :chatuser
  has_many :chatmessages, dependent: :destroy
end
