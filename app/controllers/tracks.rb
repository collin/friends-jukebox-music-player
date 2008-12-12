class Tracks < Application
  def index
    @tracks = Track.all
    render
  end

  def show id
    @track = Track.get id
    @sources = @track.sources
    @artist = @track.artist
    render
  end
end
