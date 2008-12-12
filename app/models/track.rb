require 'uuid'
$uuid_gen = lambda{UUID.generate}
class Track
  include DataMapper::Resource

  Storage = Merb.root + '/public/tracks'
  
  property :id, Serial
  
  property :title, String,
    :length => 255
      
  property :puid, String,
    :length => 255
    
  property :uuid, String,
    :length => 255
  
  property :extension, String,
    :nullable => false
    
  property :identified, Boolean,
    :nullable => false,
    :default  => false,
    :index    => true

  belongs_to :artist 
  has n, :sources
  
  def self.create_identified source
    record = new(
      :puid   => source.info.puid_list.first,
      :title  => source.info.title,
      :artist => Artist.find_or_create_by_name(source.info.artist),
      :identified => true
    )
    record.assume_and_save source
  end
  
  def play_on_server
    system "mplayer #{stored_uri}"
  end
  
  def assume_and_save source
    assume_file source.stored_uri
    save
    self
  end

  def self.create_unidentified source
    record = new(
      :title => source.id3.title,
      :artist => Artist.find_or_create_by_name(source.id3.artist),
      :uuid => $uuid_gen.call
    )
    record.assume_and_save source
  end
  
  def self.identified
    all :identified => true
  end
  
  def self.unidentified
    all :identified => false
  end
  
  def assume_file path
    self.extension = File.extname(path)
    FileUtils.mv path, stored_uri
  end
  
  def identifier
    identified ? puid : uuid
  end
  
  def stored_uri
    "#{Storage}/#{self.identifier}#{self.extension}"
  end
  
  def public_uri
    "/public/tracks/#{self.identifier}#{self.extension}"
  end
end  
