require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Friends, "index action" do
  before(:each) do
    dispatch_to(Friends, :index)
  end
end