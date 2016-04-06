class RfidController < ApplicationController
  def home
  end
  skip_before_filter :require_login
  def create
    user = Admin.find_by(name: params[:rfid][:name].downcase)
    if user && user.authenticate(params[:rfid][:password])
      log_in user
      redirect_to new_path
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'home'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  def edit
    @admin = Admin.first
  end
  def update
    @admin = Admin.first
    if @admin.update_attributes(admin_params)
      flash[:success] = "Profile updated"
      redirect_to update_path
    else
      flash.now[:danger] = 'Invalid username/password combination'
      redirect_to update_path
    end
  end

  private

    def admin_params
      params.require(:admin).permit(:name, :password, :password_confirmation)
    end

end
