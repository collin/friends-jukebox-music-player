require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a following exists" do
  Following.all.destroy!
  request(resource(:following), :method => "POST", 
    :params => { :following => { :id => nil }})
end

describe "resource(:following)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:following))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of following" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a following exists" do
    before(:each) do
      @response = request(resource(:following))
    end
    
    it "has a list of following" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Following.all.destroy!
      @response = request(resource(:following), :method => "POST", 
        :params => { :following => { :id => nil }})
    end
    
    it "redirects to resource(:following)" do
      @response.should redirect_to(resource(Following.first), :message => {:notice => "following was successfully created"})
    end
    
  end
end

describe "resource(@following)" do 
  describe "a successful DELETE", :given => "a following exists" do
     before(:each) do
       @response = request(resource(Following.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:following))
     end

   end
end

describe "resource(:following, :new)" do
  before(:each) do
    @response = request(resource(:following, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@following, :edit)", :given => "a following exists" do
  before(:each) do
    @response = request(resource(Following.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@following)", :given => "a following exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Following.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @following = Following.first
      @response = request(resource(@following), :method => "PUT", 
        :params => { :following => {:id => @following.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@following))
    end
  end
  
end

