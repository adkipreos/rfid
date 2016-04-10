class UsersController < ApplicationController
  def new
    @users = User.all
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
      redirect_to new_path

    else
      flash[:danger] = "Cannot create User!"
      redirect_to new_url
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to new_path
  end
  private

    def user_params
      params.require(:user).permit(:name, :lastname, :rfid)
    end
end
