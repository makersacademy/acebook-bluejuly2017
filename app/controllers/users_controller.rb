class UsersController < Clearance::UsersController

    private

  def post_params
    params.require(:user).permit(:message)
  end
end
