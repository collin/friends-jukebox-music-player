require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/artists" do
  before(:each) do
    @response = request("/artists")
  end
end