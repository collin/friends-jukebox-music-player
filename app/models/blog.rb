require 'rfeedparser'

class Blog
  include DataMapper::Resource
  
  property :id, Serial
  property :url, String, 
    :length => 255,
    :nullable => false, 
    :unique => true
  
  property :feed_url, String, 
    :length => 255,
    :nullable => false
    
  property :cache, Yaml
  property :last_fetch, DateTime
  
  # ttl in minutes
  property :ttl, Integer,
    :nullable => false,
    :default => 60
  
  has n, :blog_posts
  
  after :create, :generate_blog_posts
  
  before :valid? do
    pre_create_actions if new_record?
  end
  
  validates_with_block :url do
    unless has_entries?
      [false, 
        "That does not appear to be a feed. I cannot find any entries.
      "]
    else
      true
    end      
  end
  
  def pre_create_actions
    self.feed_url = self.url
    fetch
    look_for_alternate
    ttl = feed["ttl"]
  end

  def generate_blog_posts
    fetch
    entries.each do |entry| 
      BlogPost.create :blog_id => self.id, :cache => entry
    end
  end
  
  def has_entries?
    not entries.empty?
  end
  
  def look_for_alternate
    return if has_entries?
    alternate_link = feed.links && feed.links.find{|attrs| attrs["rel"] == "alternate" }
    return if alternate_link.nil?
    self.feed_url = alternate_link["href"]
    fetch
  end

  def feed
    cache.feed
  end

  def entries
    cache.entries
  end
  
  def self.find_or_build_by_url url
    record = first :url => url
    record.nil? ? new(:url => url) : record
  end
  
  def fetch
    if stale?
      Merb.logger.info "Fetching Feed: #{self.feed_url}"
      self.cache = FeedParser.parse(self.feed_url.to_s) 
      self.last_fetch = DateTime.now
      save unless new_record?
    end
  end
  
  def stale?
    new_record? or (DateTime.now - ttl > last_fetch)
  end
  
  def title
    feed["title"] or self.url
  end
end
