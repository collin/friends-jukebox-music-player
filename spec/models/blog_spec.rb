require File.join( File.dirname(__FILE__), '..', "spec_helper" )
PrimaryUrl   = "http://notmanyexperts.blogspot.com/"
AlternateUrl = "http://notmanyexperts.blogspot.com/feeds/posts/default"

class Blog
  def self.make attrs={}

    defaults = {
      :url => PrimaryUrl
    }

    send attrs.delete(:new) ? 'new' : 'create', defaults.merge(attrs)
  end
end


describe Blog do

  it "should have a url" do
    Blog.make(:url => nil).
      errors.on(:url).should_not be_empty
  end
  
  it "stores urls as URI" do
    Blog.make.url.should be_is_a(Addressable::URI)
  end
  
  it "stores alternate_urls as URI" do
    Blog.make.alternate_url.should be_is_a(Addressable::URI)
  end
  
  it "fetches feed url" do
    Blog.make.alternate_url.to_s.should == AlternateUrl
  end

  it "doesn't fetch feed url if url is a feed" do
    b= Blog.make(:url => AlternateUrl)
    
    b.url.to_s.should == b.alternate_url.to_s
  end
  
  it "fetches feed into cache" do
    Blog.make.cache.should_not be_nil
  end
  
  it "stores cache in db" do
    b = Blog.make
    cache = b.cache
    b.reload
    b.cache.should_not be_nil?
  end
  
  it "stale when new record" do
    Blog.new.should be_stale
  end
  
  it "stale after 60 minutes" do
    b = Blog.make
    b.updated_at += 61
    b.should be_stale
  end
  
  it "not stale under 60 minutes" do
    b = Blog.make
    b.updated_at += 45
    b.should_not be_stale
  end
end
