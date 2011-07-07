require File.dirname(__FILE__) + '/../spec_helper'

describe Author do
  before(:each) do
    @attr={:name =>'Will', :bio=>'RocketScientist'}
  end

  it "should make a new instance using valid attribute" do
    Author.new(@attr).should be_valid
  end

  it "should require a name"

  it "should reject names that are too long"

  it "should require a bio"

  it "should reject bios that are too long"

end


