class AddNameToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :name, :string
    add_index :works, :author_id
  end

  def self.down
    remove_column :works, :name
    remove_index :works, :author_id
  end
end
