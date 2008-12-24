class Blog
  include DataMapper::Resource
  
  property :id, Serial
  
  property :url, URI,
    :length => 255,
    :nullable => false

  property :alternate_url, URI,
    :length => 255
    
  property :cache, Yaml
  
  timestamps :at
    
  before :valid?, :fetch_feed_content
  before :valid?, :fetch_alternate_url

  after :valid?, :set_timestamps

  def fetch_alternate_url
    return if url.nil?
    
    self.alternate_url = url
    return if has_entries?
    
    self.alternate_url = links.find do |attrs| 
      attrs["rel"] == "alternate"
    end["href"]
  end
  
  def has_entries?
    not entries.blank?
  end
  
  def links
    cache.feed.links
  end
  
  def entries
    cache.entries
  end
  
  def fetch_feed_content
    self.cache = FeedParser.parse(available_url.to_s) if stale?
  end
  
  def stale?
    return true if new_record?
    updated_at > 1.hour.ago
  end
  
  def available_url
    url || alternate_url
  end
end
