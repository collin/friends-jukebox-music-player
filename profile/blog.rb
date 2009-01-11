#require 'ruby-prof'
BlogUrl = "http://www.stereogum.com/"
b=Blog.first(:url => BlogUrl)
b.destroy unless b.nil?


#RubyProf.start

Blog.create :url => BlogUrl

#result = RubyProf.stop

#file = File.open(Merb.root/'profile/blog.html', 'w+')
#printer = RubyProf::GraphHtmlPrinter.new(result)
#printer.print(file, :min_percent=>0)

