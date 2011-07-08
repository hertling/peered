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

class Work < ActiveRecord::Base
  attr_accessible :name, :content, :author_id

  belongs_to :author

  validates :name,    :presence => true, :length => { :maximum => 255 }
  validates :content, :presence => true
end
