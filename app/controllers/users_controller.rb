# app/controllers/users_controller.rb
class UsersController < Clearance::UsersController

  def show
    @user = current_user
  end

  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)
    bio = user_params.delete(:bio)
    dob = user_params.delete(:dob)
    interests = user_params.delete(:interests)
    location = user_params.delete(:location)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
      user.bio = bio
      user.dob = dob
      user.interests = interests
      user.location = location
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

end
