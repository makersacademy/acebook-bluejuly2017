class Chatuser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :chat_rooms, dependent: :destroy
  has_many :chatmessages, dependent: :destroy

  def name
    email.split('@')[0]
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
