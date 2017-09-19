class User < ApplicationRecord
  include Clearance::User
end


# first_name | last_name | bio | interests | location | birthday
