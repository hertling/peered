require File.dirname(__FILE__) + '/../spec_helper'

describe Editor do
  before(:each) do
    @attr = { :name => "Maddie Whitmarsh", :bio => "College Student" }
  end

  it "should create a new instance given valid attributes" do
    Editor.create!(@attr)
  end

  it "should require a name" do
    no_name_editor = Editor.new(@attr.merge(:name => ""))
    no_name_editor.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_editor = Editor.new(@attr.merge(:name => long_name))
    long_name_editor.should_not be_valid
  end

end
