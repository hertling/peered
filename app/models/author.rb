class Author < ActiveRecord::Base
  attr_accessible :name, :bio

  has_many :works
end
