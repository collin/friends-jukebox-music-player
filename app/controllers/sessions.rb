class Sessions < Application

  # ...and remember, everything returned from an action
  # goes to the client...
  def new
    @session = session
    render :new
  end
  
  def create
    @session = session
    password_auth
    if logged_in?
      redirect url(:home)
    else
      render :new
    end
  end
end
