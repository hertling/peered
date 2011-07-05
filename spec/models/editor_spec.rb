require File.dirname(__FILE__) + '/../spec_helper'

describe Editor do
  it "should be valid" do
    Editor.new.should be_valid
  end
end
