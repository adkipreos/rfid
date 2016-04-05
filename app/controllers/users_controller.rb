class UsersController < ApplicationController
  def new
  end
  def signup
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created!"
      redirect_to @user

    else
      redirect_to signup_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :lastname, :rfid)
    end
end
