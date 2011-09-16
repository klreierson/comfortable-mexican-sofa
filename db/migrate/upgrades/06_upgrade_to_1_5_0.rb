class UpgradeTo150 < ActiveRecord::Migration
  def self.up
    add_column :cms_snippets, :position,  :integer, :null => false, :default => 0
    add_column :cms_files, :position,     :integer, :null => false, :default => 0
    
    add_index :cms_snippets, [:site_id, :position]
    add_index :cms_files, [:site_id, :position]
  end
  
  def self.down
    remove_index :cms_snippets, [:site_id, :position]
    remove_index :cms_files, [:site_id, :position]
    
    remove_column :cms_snippets, :position
    remove_column :cms_files, :position
  end
end
