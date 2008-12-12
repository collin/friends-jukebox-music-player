class Artists < Application

  def index
    @artists = Artist.all
    render
  end

  def show id
    @artist = Artist.get id
    @tracks = @artist.tracks
    render
  end
  
end
