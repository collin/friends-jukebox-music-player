class Application < Merb::Controller
  before { @source = Source.new; @blog = Blog.new }
  
  log_params_filtered :password
  log_params_filtered :password_confirmation

  
  def fetch_user
    User.get(session["user"])
  end

  def current_user
    @current_user||= unless (user = fetch_user).nil? 
      user
    else
      session.abandon!
      raise Unauthenticated
    end if session.authenticated?
  end

  def store_user user
    session["user"] = user.new_record? ? user : user.id
  end
end
