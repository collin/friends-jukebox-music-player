class Source
  Identifyer = Earworm::Client.new(MusicDnsKey)
  
  include DataMapper::Resource

  Storage = Merb.root + '/public/sources'
  
  property :id, Serial

  property :url, String,
    :nullable => false,
    :unique   => true,
    :length   => 255
    
  belongs_to :track
  belongs_to :blog_post
  
  attr_accessor :info
  
  def valid?(context)
    super(context)
    errors.empty?
  end
  
  def self.find_or_build_by_url url
    record = first :url => url
    record.nil? ? self.new(:url => url) : record
  end
  
  validates_with_block do
    begin
      unless self.url.blank?
        if correct_filetype?
          if download
            unless identify_track
              unless create_unidentified_track
                errors.add :url, "
                  I can't identify that track. This is not for fringe music just yet.
                  I'll let you upload unidentifiable tracks soon.    
                "
              end
            end
          else
            errors.add :url, "
              Having trouble getting that track. Are you sure the file is there?  
            "
          end 
        else   
          errors.add :url, "
            Tracks have to be .mp3. What a janky jukebox, eh?
            Can't even play '.flac'?
          "
        end
      end
      true
    rescue => e
      errors.add :url, %{
        Unexpected error identifying your track: "#{e.message}."
        Sorry, that message is probably obtuse.
        I'm determined to fix all those little problems.
        Audio is a tricky thing, and some times unpleasent things
        happen inside computers. Wouldn't it be wonderful if everything 'just worked?'    
      }
      true
    end 
  end
  
  def blog_host
    Addressable::URI.parse(url).host
  end
  
  def blog_url
    "http://#{blog_host}"
  end
  
  def identify_track
    self.info = Identifyer.identify(:file => stored_uri)
    unless self.info.puid_list.empty?
      find_or_create_identified_track
    else
      false
    end
  end
  
  def id3
    @id3 ||= ID3Lib::Tag.new(stored_uri)
  end
  
  def create_unidentified_track
    if id3.title && id3.artist
      self.track = Track.create_unidentified self  
      true
    else
      false
    end
  end
  
  def find_or_create_identified_track
    self.track = Track.first(:puid => self.info.puid_list.first)
    if self.track.nil?
      self.track = Track.create_identified self
    end
    true
  end
  
  def correct_filetype?
    url && url.to_s.match(/\.(mp3)$/)
  end
  
  def download
    command = "wget \"#{url.shell_escape}\" -O #{stored_uri}"
    Merb.logger.info "Downloading Source: #{command.shell_escape}"
    system command
  end
  
  def extension
    File.extname(url)
  end
  
  def stored_uri
    @stored_uri ||= "#{Tempfile.new('').path}#{extension}"
  end
end
