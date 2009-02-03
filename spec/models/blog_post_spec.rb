require File.join( File.dirname(__FILE__), '..', "spec_helper" )
require File.join( File.dirname(__FILE__), '..', "blog_fixtures" )

describe BlogPost do

  before :each do
    Blog.all.destroy!
    BlogPost.all.destroy!
  end

  it "has a url which must not be blank" do
    BlogPost.make(:url => nil).
      errors.on(:url).should_not be_nil
  end
  
  it "must have a unique url" do
    BlogPost.make
    BlogPost.make.errors.on(:url).should_not be_nil
  end
  
  it "cannot have blank entry" do
    BlogPost.make(:entry => nil).
      errors.on(:entry).should_not be_nil
  end
  
  it "must belong to a blog" do
    BlogPost.make(:blog => nil).
      errors.on(:blog).should_not be_nil
  end
  
  it "greps tracks from src and hrefs" do
    BlogPost.make.tracks.should == [FirstTrack]
  end
  
  it "greps wordpress audio plugins with flashvars" do
    bp = BlogPost.new
    bp.meta_def :page do; StAndrew[:page] end
    bp.wordpress_flashvars(:page).should == StAndrew[:tracks]
  end
  
  it "greps tracks for src and hrefs page st_andrew" do
    bp = BlogPost.new
    bp.meta_def :page do; StAndrew[:page] end
    bp.href_and_src(:page).should == StAndrew[:tracks]
  end
  
  it "doesn't double up on tracks from page" do
    bp = BlogPost.new
    bp.meta_def :page do; StAndrew[:page] end
    bp.tracks_from_page.should == StAndrew[:tracks]
  end
  
  it "greps wordpress audio plugins with javascript source" do
    BlogPost.make(
      :url => LeetleGroovePost.link, 
      :entry => LeetleGroovePost
    ).tracks.should == [LeetleGroove]
  end
  
  it "greps tumblr audio" do
    bp = BlogPost.new
    bp.meta_def :page do; Tumblr[:page] end
    bp.tracks_from_page.should == Tumblr[:tracks]
  end
  
  it "pulls title from entry" do
    BlogPost.make.title.should == FirstPostTitle
  end
end
