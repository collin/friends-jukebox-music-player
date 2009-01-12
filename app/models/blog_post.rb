class BlogPost
  include DataMapper::Resource
  
  property :id, Serial

  property :url, String,
    :length => 255,
    :nullable => false,
    :unique => true
    
  property :entry, Yaml,
    :nullable => false
    
  property :page, Text
    
  belongs_to :blog
  
  validates_present :blog
  
  def tracks
    found = tracks_from_feed
    if found.empty?
      fetch_page! if page.nil?
      tracks_from_page
    else
      found
    end
  end
  
  def tracks_from_page
    href_and_src(:page) + wordpress_audio_player(:page)
  end
  
  def tracks_from_feed
    href_and_src(:content)
  end
  
  def href_and_src method
    document = Hpricot.parse send(method)
    (document/"[@href*='mp3']").map{|anchor| anchor["href"] } +
    (document/"[@src*='mp3']").map{|audio|   audio["src"] }
  end
  
  def wordpress_audio_player attribute
    tracks = []
    attribute_get(attribute).gsub /soundFile:"(.*?)"/ do |match|
      tracks << $1; ''
    end
    
    tracks.map do |encoded|
      Base64.decode64 encoded
    end
  end
  
  def fetch_page!
    self.page = open(url).read 
  end
  
  def title
    entry.title
  end
  
  def content
    entry.content
  end
end
