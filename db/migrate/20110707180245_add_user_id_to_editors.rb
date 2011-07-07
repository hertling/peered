class AddUserIdToEditors < ActiveRecord::Migration
  def self.up
    add_column :editors, :user_id, :integer
    add_index :editors, :user_id
  end

  def self.down
    remove_index :editors, :user_id
    remove_column :editors, :user_id
  end
end
