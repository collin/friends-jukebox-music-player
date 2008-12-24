require File.join( File.dirname(__FILE__), '..', "spec_helper" )

class Blog
  def self.make attrs={}

    defaults = {

    }

    send attrs.delete(:new) ? 'new' : 'create', defaults.merge(attrs)
  end
end


describe Blog do

  it "should have a url" do
    Blog.make(:url => nil).
      should_have_errors on(:url)
  end

end
