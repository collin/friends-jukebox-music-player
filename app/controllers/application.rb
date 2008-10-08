class Application < Merb::Controller

  def restrict_access
    authenticate or raise Unauthorized
  end

  def authenticate
    cookie_auth or password_auth
  end

  
  def cookie_auth
    @current_user = Friend.find_by_id session[:friend_id]
  end

  def password_auth
    return false unless params['merb::cookie_session']
    f= Friend.find_by_email(params['merb::cookie_session']['email'])
    if f && f.password == params['merb::cookie_session']['password']
      @current_user = f
      flash[:notice] = "Thanks for logging in, have a good time!"
      session[:friend_id] = f.id
    else
      session.errors.add :login, "Bad email/password combination."
    end
  end 
  
  def logged_in?
    @current_user
  end
end
