require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Track do
  Track.meta_def :props do
    properties.map { |p| p.name } 
  end

  before(:each) do 
    @track = Track.new
  end
  
  it "should have url property" do
    Track.props.should include(:url)
  end
  
  it "should require url" do
    @track.valid?.should
  end

end
