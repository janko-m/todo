class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate!
    case params[:format]
    when nil, "html", "js"
      redirect_to login_path if not logged_in?
    when "json"
      @current_user = AuthenticationService.authenticate_from_headers(request.headers)
      head :unauthorized if not logged_in?
    end
  end

  def log_in!(user)
    session[:user_id] = user.id
  end

  def log_out!
    session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.where(id: session[:user_id]).first
  end
  helper_method :current_user

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?
end
