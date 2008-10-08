require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Follows, "index action" do
  before(:each) do
    dispatch_to(Follows, :index)
  end
end