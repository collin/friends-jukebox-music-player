class BlogPost
  include DataMapper::Resource
  
  property :id, Serial

  property :url, String,
    :length => 255,
    :nullable => false,
    :unique => true
    
  property :entry, Yaml,
    :nullable => false
    
  belongs_to :blog
  
  validates_present :blog
  
  def tracks
    (doc/"[@href*='mp3']").map{|anchor| anchor["href"] } +
    (doc/"[@src*='mp3']").map{|audio|   audio["src"] }
  end
  
  def doc
    @doc ||= Hpricot.parse entry.content
  end
  
  def title
    entry.title
  end
end
