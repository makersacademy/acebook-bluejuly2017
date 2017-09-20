module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_chatuser

    def connect
      self.current_chatuser = find_verified_chatuser
      logger.add_tags 'ActionCable', current_chatuser.email
    end

    protected

    def find_verified_chatuser # this checks whether a user is authenticated with devise
      if verified_chatuser = env['warden'].chatuser
        verified_chatuser
      else
        reject_unauthorized_connection
      end
    end
  end
end
