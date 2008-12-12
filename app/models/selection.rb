class Selection
  include DataMapper::Resource
  
  property :id, Serial

  property :played, Boolean,
    :nullable => false,
    :default => false,
    :index => true

  belongs_to :jukebox
  belongs_to :track

  is :list, :scope => [:jukebox_id]
end
