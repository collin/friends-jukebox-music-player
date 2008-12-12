class Followings < Application
  # provides :xml, :yaml, :js

#  def index
#    @followings = Following.all
#    display @followings
#  end

  def create(following)
    following[:follower] = fetch_user
    @following = Following.new(following)
    if @following.save
      redirect resource(:users), :message => {:notice => "Following was successfully created"}
    else
      raise @following.errors.inspect
      message[:error] = "Following failed to be created"
      render :template => 'users/index'
    end
  end

#  def update(id, following)
#    @following = Following.get(id)
#    raise NotFound unless @following
#    if @following.update_attributes(following)
#       redirect resource(@following)
#    else
#      display @following, :edit
#    end
#  end

#  def destroy(id)
#    @following = Following.get(id)
#    raise NotFound unless @following
#    if @following.destroy
#      redirect resource(:following)
#    else
#      raise InternalServerError
#    end
#  end

end # Following
