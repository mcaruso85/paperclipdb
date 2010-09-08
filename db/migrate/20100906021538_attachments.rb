class Attachments < ActiveRecord::Migration
  def self.up
     create_table :attachments do |t|
      t.string :dir_name, :null => false
      t.string :base_name, :null => false
      t.binary :file_data, :null => false
      t.string :content_type
      t.integer :file_size
      t.timestamps
    end
    add_index :attachments, [:base_name, :dir_name], :unique => true
  end

  def self.down
    drop_table :attachments
  end
end
