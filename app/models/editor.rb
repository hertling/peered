class Editor < ActiveRecord::Base
  attr_accessible :name, :bio

  validates :name, :presence => true, :length => { :maximum => 50 }
end
