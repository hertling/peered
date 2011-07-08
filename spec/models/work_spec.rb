# == Schema Information
#
# Table name: works
#
#  id         :integer         not null, primary key
#  content    :text
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

require File.dirname(__FILE__) + '/../spec_helper'

describe Work do
  before(:each) do
    @attr = { :name => "Magnum Opus", 
              :content => "It was a dark and story night..." }
  end
  it "should be valid" do
    Work.create!(@attr).should be_valid
  end

  it "should require a name" do
    no_name_work = Work.new(@attr.merge(:name => " "))
    no_name_work.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 256
    long_name_work = Work.new(@attr.merge(:name => long_name))
    long_name_work.should_not be_valid
  end

  it "should require content" do
    no_content_work = Work.new(@attr.merge(:content => " "))
    no_content_work.should_not be_valid
  end

end
