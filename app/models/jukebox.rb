class Jukebox
  include DataMapper::Resource
  
  property :id, Serial

  property :name, Text,
    :length => 255,
    :nullable => false
    
  property :plays, Integer,
    :nullable => false,
    :default => 0,
    :writer => :private
    
  has n, :selections
  has n, :tracks, :through => :selections
end
