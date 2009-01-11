PrimaryUrl   = "http://www.whitefolksgetcrunk.com/"
AlternateUrl = "http://feeds.feedburner.com/whitefolksgetcrunk/kktr"

PrimaryFeed = FeedParser.parse File.read("#{File.dirname(__FILE__)}/primary_feed")
AlternateFeed = FeedParser.parse File.read("#{File.dirname(__FILE__)}/alternate_feed")

BlogTitle = "White Folks Get Crunk"
BlogPostCount = AlternateFeed.entries.size.inspect

FirstPost = AlternateFeed.entries.first
FirstPostTitle = "Electro Thuggin’ - The ReUp"
FirstTrack = "http://www.whitefolksgetcrunk.com/wp-content/uploads/2008/12/throw-some-disco-lo.mp3"

module FeedParser
  class << self
    alias old_parse parse
  end
  
  def self.parse(uri)
    if uri == PrimaryUrl
      PrimaryFeed
    elsif uri == AlternateUrl
      AlternateFeed
    else
      old_parse uri
    end
  end
end

class Blog
  def self.make url=PrimaryUrl
    self.locate url
  end
end

makeable BlogPost,
  :url => FirstPost.link,
  :entry => FirstPost,
  :blog => proc{ Blog.make }
  


