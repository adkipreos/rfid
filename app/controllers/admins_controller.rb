class AdminsController < ApplicationController

    def index

    end

    def new

    end

    def create

    end

    def show

    end

    def edit

    end

    def update
        @user = Admin.find(params[:id])
        if @user.update_attributes(admin_params)
          flash[:success] = "Profile updated"
          redirect_to update_path
        else
            flash.now[:danger] = 'Invalid username/password combination'
            redirect_to update_path
        end
    end

    def destroy

    end

    private

    def admin_params
      params.require(:admin).permit(:name, :password, :password_confirmation)
    end

end