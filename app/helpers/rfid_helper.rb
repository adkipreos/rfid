module RfidHelper
  def log_in(admin)
    session[:admin_id] = admin.id
  end
  def log_out
    session.delete(:admin_id)
  end
  def current_user
    @current_user ||= Admin.find_by(id: session[:admin_id])
  end
end
