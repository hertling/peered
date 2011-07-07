class Work < ActiveRecord::Base
  attr_accessible :name, :content, :author_id

  belongs_to :author

  validates :name,    :presence => true, :length => { :maximum => 255 }
  validates :content, :presence => true
end
