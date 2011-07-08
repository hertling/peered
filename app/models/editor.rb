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

class Editor < ActiveRecord::Base
  attr_accessible :name, :bio
  belongs_to :user
  
  validates :name,    :presence => true, :length => { :maximum => 50 }
  validates :user_id, :presence => true
end
