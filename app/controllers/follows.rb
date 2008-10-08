class Follows < Application
   provides :xml, :yaml, :js

  # GET /follows
  def index
    @follows = Follow.find(:all)
    display @follows
  end

  # GET /follows/:id
  def show
    @follow = Follow.find_by_id(params[:id])
    raise NotFound unless @follow
    display @follow
  end

  # GET /follows/new
  def new
    only_provides :html
    @follow = Follow.new(params[:follow])
    render
  end

  # POST /follows
  def create
    @follow = Follow.new(params[:follow])
    if @follow.save
      display @follow
    else
      raise NotAcceptable
    end
  end

  # GET /follows/:id/edit
  def edit
    only_provides :html
    @follow = Follow.find_by_id(params[:id])
    raise NotFound unless @follow
    render
  end

  # PUT /follows/:id
  def update
    @follow = Follow.find_by_id(params[:id])
    raise NotFound unless @follow
    if @follow.update_attributes(params[:follow])
      redirect url(:follow, @follow)
    else
      raise BadRequest
    end
  end

  # DELETE /follows/:id
  def destroy
    @follow = Follow.find_by_id(params[:id])
    raise NotFound unless @follow
    if @follow.destroy
      redirect url(:follows)
    else
      raise BadRequest
    end
  end

end
