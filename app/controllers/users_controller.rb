class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully registered!"
      redirect_to root_path
    else
      redirect_to users_new_path
      flash[:alert] = @user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :username, :role)
  end
end
