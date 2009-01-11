doc = Hpricot.parse(open("http://hypem.com/toplist"))
list = (doc/"[@href*=http://del.icio.us/url/]")[0..100].map do |a|
  a["href"].lstrip.gsub("http://del.icio.us/url/?url=", '')
end

for url in list
  Blog.create(:url => url)
end
