class UsersController < Clearance::UsersController

  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)
    bio = user_params.delete(:bio)
    dob = user_params.delete(:dob)
    interests = user_params.delete(:interests)
    location = user_params.delete(:location)


  def post_params
    params.require(:user).permit(:message)
  end


  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

end
