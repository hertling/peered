class AddUserIdToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :user_id, :integer
    add_index :authors, :user_id
  end

  def self.down
    remove_index :authors, :user_id
    remove_column :authors, :user_id
  end
end
