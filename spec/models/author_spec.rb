require File.dirname(__FILE__) + '/../spec_helper'

describe Author do
  it "should be valid" do
    Author.new.should be_valid
  end

  describe "success" do
    before(:each) do
      @attr={:name =>'Will', :bio=>'RocketScientist'}
    end
    
    it "should have a name" do
      a = Author.new(@attr)
      a.name.should == @attr[:name]
    end

    it "should have a bio" do
      a = Author.new(@attr)
      a.bio.should == @attr[:bio]
    end
    
  end
  
  describe "failure" do
    it "should reject an empty name" do
      Author.new(:name=>"").should_not be_valid
    end
  end
end


