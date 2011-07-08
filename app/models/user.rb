# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_one :editor
  has_many :authors # to allow publishing under pseudonym
  
  def self.find_or_create_by_auth(auth_data)
    find_or_create_by_provider_and_uid(auth_data["provider"], auth_data["uid"], 
                                                :name => auth_data["user_info"]["name"])   
  end
  
end
