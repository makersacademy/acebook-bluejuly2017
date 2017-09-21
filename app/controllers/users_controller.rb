class UsersController < Clearance::UsersController
  def index
    @users = User.all
  end

    private

  def post_params
    params.require(:user).permit(:message)
  end
end
