class Welcome < Application

  before :restrict_access
  
  def index
    render
  end
  
end
