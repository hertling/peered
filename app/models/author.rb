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

class Author < ActiveRecord::Base
  attr_accessible :name, :bio
  belongs_to :user
  
  has_many :works

  validates :name,    :presence => true, :length => { :maximum => 50 }
  validates :bio,     :presence => true, :length => { :maximum => 255 }
  validates :user_id, :presence => true
end
