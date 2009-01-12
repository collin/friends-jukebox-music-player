class Blog
  include DataMapper::Resource

  property :id, Serial
  
  property :url, String,
    :length => 255,
    :nullable => false,
    :unique => true
    
  property :cache, Yaml
  
  has n, :blog_posts
  
  timestamps :at
    
  before :valid?, :set_url_to_canonical_id
  before :valid?, :set_timestamps
  
  before :create, :make_stale
  before :create,  :cache_feed
  
  def generate_blog_posts!
    entries.each do |entry|
      self.blog_posts.create :url => entry.link, :entry => entry
    end
  end
 
  def make_stale
    self.updated_at = (Time.now - (Blog.time_to_live + 1)).to_datetime
  end
  
  def stale?
    return true if new_record?
    !((Time.now - Blog.time_to_live)..Time.now).include?(updated_at.to_time)
  end
  
  def available_url
    alternate_url ? alternate_url : url
  end

  def set_url_to_canonical_id
    self.url = google_feed && google_feed.canonical_id
  end
  
  def google_feed
    @google_feed||= Google::Ajax::Feed.lookup(url) unless url.nil?
  end
  
  def cache_feed
    return unless stale?
    self.cache = google_feed
  end
  
  def title
    cache and (cache.title or cache.link)
  end
  
  def method_missing method, *args, &block
    if cache.respond_to? method
      cache.send method, *args, &block
    else
      super method, *args, &block
    end
  end
  
  def self.time_to_live
    60.minutes
  end
  
  def self.stale
    all :updated_at.lt => (Time.now - time_to_live).to_datetime
  end
end
