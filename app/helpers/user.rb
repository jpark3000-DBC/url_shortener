helpers do
  def current_user
    if session[:user]
      @current_user ||= session[:user]
    end
  end

  def logged_in?
    !current_user.nil?
  end

end
