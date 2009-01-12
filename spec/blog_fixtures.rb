PrimaryUrl   = "http://www.whitefolksgetcrunk.com/"
AlternateUrl = "http://feeds.feedburner.com/whitefolksgetcrunk/kktr"

#PrimaryFeed = FeedParser.parse File.read("#{File.dirname(__FILE__)}/primary_feed")
#AlternateFeed = FeedParser.parse File.read("#{File.dirname(__FILE__)}/alternate_feed")

Fixtures = Pathname.new(Pathname.new(__FILE__).dirname)

BlogTitle = "White Folks Get Crunk"
BlogPostCount = 15 #AlternateFeed.entries.size.inspect

FirstPost = YAML.load( (Fixtures+"first_post").read)

FirstPostTitle = "Can’t Believe It - Smoother than Silk Mix"
FirstTrack = "http://www.whitefolksgetcrunk.com/wp-content/uploads/2009/01/t-pain-can_t-believe-it-_hey-champ-rmx-feat-dj-white-shadow_.mp3"

LeetleGroovePost = YAML.load((Fixtures+"leetle_groove").read)
LeetleGroove = "http://olympichifi.com/wp-content/uploads/2008/10/leetle-groove.mp"

makeable Blog,
  :url => PrimaryUrl

makeable BlogPost,
  :url => FirstPost.link,
  :entry => FirstPost,
  :blog => proc{ Blog.make }

