require File.dirname(__FILE__) + '/../spec_helper'

describe Work do
  it "should be valid" do
    Work.new.should be_valid
  end
end
