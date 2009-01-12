PrimaryUrl   = "http://www.whitefolksgetcrunk.com/"
AlternateUrl = "http://feeds.feedburner.com/whitefolksgetcrunk/kktr"

#PrimaryFeed = FeedParser.parse File.read("#{File.dirname(__FILE__)}/primary_feed")
#AlternateFeed = FeedParser.parse File.read("#{File.dirname(__FILE__)}/alternate_feed")

BlogTitle = "White Folks Get Crunk"
BlogPostCount = 15 #AlternateFeed.entries.size.inspect

FirstPost = YAML.load File.read("#{File.dirname(__FILE__)}/first_post")
FirstPostTitle = "Can’t Believe It - Smoother than Silk Mix"
FirstTrack = "http://www.whitefolksgetcrunk.com/wp-content/uploads/2009/01/t-pain-can_t-believe-it-_hey-champ-rmx-feat-dj-white-shadow_.mp3"

makeable Blog,
  :url => PrimaryUrl

makeable BlogPost,
  :url => FirstPost.link,
  :entry => FirstPost,
  :blog => proc{ Blog.make }

