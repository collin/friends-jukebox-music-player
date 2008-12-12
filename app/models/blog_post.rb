class BlogPost
  include DataMapper::Resource
  
  property :id, Serial
  property :cache, Yaml
  
  property :url, String, 
    :length => 255,
    :nullable => false, 
    :unique => true
  
  belongs_to :blog
  
  has n, :sources
  
  before :valid? do
    self.url = cache.link unless self.url
  end
  
  after :create, :source_songs
  
  def source_songs
    from_selector :href
    from_selector :src
  end
  
  def from_selector attribute
    (self.doc/"[@#{attribute.to_s}*=mp3]").each do |mp3|
      Source.create :url => mp3[attribute], :blog_post => self
    end
  end
  
  def doc 
    @doc ||= Hpricot.parse content 
  end

  def content
    cache.content && cache.content.first["value"]
  end
  
  def summary
    cache.summary || "No summary!"
  end

  def method_missing name, *attrs
    key = name.to_s
    cache.has_key?(key) ? cache[key] : super
  end
end
