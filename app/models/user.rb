class User < ApplicationRecord
  include Clearance::User

  acts_as_voter
end
