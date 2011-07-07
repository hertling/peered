class Author < ActiveRecord::Base
  attr_accessible :name, :bio

  has_many :works

  validates :name, :presence => true, :length => { :maximum => 50 }
  validates :bio,  :presence => true, :length => { :maximum => 255 }
end
