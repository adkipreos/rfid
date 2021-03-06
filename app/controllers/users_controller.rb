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
  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
        flash[:success] = "User updated"
        redirect_to new_path
    else
        flash[:danger] = 'Invalid name/lastname'
        redirect_to update_path
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to new_path
  end
  private

    def user_params
      params.require(:user).permit(:name, :lastname, :rfid, :block)
    end
end
