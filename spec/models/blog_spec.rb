require File.join( File.dirname(__FILE__), '..', "spec_helper" )
require File.join( File.dirname(__FILE__), '..', "blog_fixtures" )

describe Blog do
  before :each do
    Blog.all.destroy!
    BlogPost.all.destroy!
  end

  it "creates blogs" do
    Blog.make.id.should_not be_nil
  end

  it "should have a url" do
    Blog.make(:url => nil).
      errors.on(:url).should_not be_empty
  end
  
  it "requires url uniqueness" do
    Blog.make.errors.on(:url).should     be_nil
    Blog.make.errors.on(:url).should_not be_nil
  end
  
  it "fetches feed url" do
    Blog.make.alternate_url.to_s.should == AlternateUrl
  end

  it "doesn't fetch feed url if url is a feed" do
    b= Blog.make(:url => AlternateUrl)
    
    b.url.should == b.alternate_url
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
  
  it "has a time to live of 60 minutes" do
    Blog.time_to_live.should == 60.minutes
  end
  
  it "stale after time_to_live" do
    b = Blog.make
    b.updated_at = (b.updated_at.to_time - (Blog.time_to_live + 1.minute)).to_datetime
    b.should be_stale
  end
  
  it "not stale under time_to_live" do
    b = Blog.make
    b.updated_at = DateTime.now
    b.should_not be_stale
  end
  
  it "stale blogs are stale" do
    b=Blog.make
    b.updated_at = (b.updated_at.to_time - (Blog.time_to_live + 1.minute)).to_datetime
    b.save!
    Blog.stale.should == [b]
  end
  
  it "gets title from feed" do
    Blog.make.title.should == BlogTitle
  end
  
  it "uses primary url as title in absense of feed title" do
    b = Blog.new :url => "http://google.com"
    b.title.should == "http://google.com"
  end
  
  it "makes corresponding blog posts" do
    b=Blog.make
    b.generate_blog_posts!
    b.blog_posts.map{|post| post.blog}.
      should == [b,b,b,b]
  end
  
  it "rejects non-feeds" do
    Blog.make(:url => "http://google.com").
      errors.on(:url).should_not be_nil
  end
  
  it "stale on creation" do
    Blog.make.stale?.should be_true
  end
end
