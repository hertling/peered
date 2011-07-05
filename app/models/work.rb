class Work < ActiveRecord::Base
  attr_accessible :content, :author_id

  belongs_to :author
end
