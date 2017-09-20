class UsersController < Clearance::UsersController

  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)
    dob = user_params.delete(:dob)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
      user.dob = dob
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

end