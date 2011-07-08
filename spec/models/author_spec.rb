# == Schema Information
#
# Table name: authors
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  bio        :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require File.dirname(__FILE__) + '/../spec_helper'

describe Author do
  before(:each) do
    @user = Factory(:user)
    @attr = { :name => 'Will', :bio => 'RocketScientist' }
  end

  it "should make a new instance using valid attribute" do
    @user.authors.build(@attr).should be_valid
  end

  it "should require a name" do
    no_name_author = @user.authors.build(@attr.merge(:name => " "))
    no_name_author.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_author = @user.authors.build(@attr.merge(:name => long_name))
    long_name_author.should_not be_valid
  end

  it "should require a bio" do
    no_bio_author = @user.authors.build(@attr.merge(:bio => " "))
    no_bio_author.should_not be_valid
  end

  it "should reject bios that are too long" do
    long_bio = "a" * 256
    long_bio_author = @user.authors.build(@attr.merge(:bio => long_bio))
    long_bio_author.should_not be_valid
  end

end


