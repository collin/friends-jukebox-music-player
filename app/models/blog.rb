class Blog < Google::Ajax::Feed
  include DataMapper::Resource

  property :id, Serial
  
  property :url, String,
    :length => 255,
    :nullable => false,
    :unique => true
    
  property :cache, Yaml
  
  has n, :blog_posts
  
  timestamps :at
    
  before :valid?, :url_to_canonical_id
  before :valid?, :set_timestamps
  
  before :create, :make_stale
  before :create,  :cache_feed
  
  def initialize url
    @url = url
  end
  
  def generate_blog_posts!
    fetch_feed_content
    entries.each do |entry|
      self.blog_posts.create :url => entry.link, :entry => entry
    end
  end
  
  def fetch_feed_content
    return if stale
    load
    self.cache = feed
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
    self.url = canonical_id
  end
  
  def cache_feed
    self.cache = feed if stale?
  end
  
  def feed
    if cache.nil?
      super
    else
      cache
    end
  end
  
  def self.lookup url
    blog = super(url)
    unless blog && blog.save
      first :url => blog.canonical_id
    else
      blog
    end
  end
  
  def self.time_to_live
    60.minutes
  end
  
  def self.stale
    all :updated_at.lt => (Time.now - time_to_live).to_datetime
  end
end
