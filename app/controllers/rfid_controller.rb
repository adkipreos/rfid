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

end
