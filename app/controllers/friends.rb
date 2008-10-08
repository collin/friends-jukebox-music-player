class Friends < Application
  # provides :xml, :yaml, :js

  before :restrict_access

  # GET /friends
  def index
    @friends = @current_user.others
    display @friends
  end

  # GET /friends/:id
  def show
    @friend = Friend.find_by_id(params[:id])
    raise NotFound unless @friend
    display @friend
  end

  # GET /friends/new
  def new
    only_provides :html
    @friend = Friend.new(params[:friend])
    render
  end

  # POST /friends
  def create
    @friend = Friend.new(params[:friend])
    if @friend.save
      redirect url(:friend, @friend)
    else
      render :new
    end
  end

  # GET /friends/:id/edit
  def edit
    only_provides :html
    @friend = Friend.find_by_id(params[:id])
    raise NotFound unless @friend
    render
  end

  # PUT /friends/:id
  def update
    @friend = Friend.find_by_id(params[:id])
    raise NotFound unless @friend
    if @friend.update_attributes(params[:friend])
      redirect url(:friend, @friend)
    else
      raise BadRequest
    end
  end

  # DELETE /friends/:id
  def destroy
    @friend = Friend.find_by_id(params[:id])
    raise NotFound unless @friend
    if @friend.destroy
      redirect url(:friends)
    else
      raise BadRequest
    end
  end

end
