require File.dirname(__FILE__) + '/../spec_helper'

describe Author do
  it "should be valid" do
    Author.new.should be_valid
  end
end
