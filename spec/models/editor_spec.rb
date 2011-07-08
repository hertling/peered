# == Schema Information
#
# Table name: editors
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  bio        :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

require File.dirname(__FILE__) + '/../spec_helper'

describe Editor do
  before(:each) do
    @user = Factory(:user)
    @attr = { :name => "Maddie Whitmoosh", :bio => "College Student" }
  end

  it "should create a new instance given valid attributes" do
    @user.build_editor(@attr).should be_valid
  end

  it "should require a name" do
    no_name_editor = @user.build_editor(@attr.merge(:name => ""))
    no_name_editor.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_editor = @user.build_editor(@attr.merge(:name => long_name))
    long_name_editor.should_not be_valid
  end

end
