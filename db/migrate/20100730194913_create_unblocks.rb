class CreateUnblocks < ActiveRecord::Migration
  def self.up
    create_table "unblocks", :force => true do |t|
      
      # Basic Identification
      t.integer   :user_id, :null => false
      t.date      :weekdate, :null => false          # specifies the sunday starting the week this row represents
      t.integer   :dayflags, :limit => 2, :default => 0, :null => false # yes we want a 1-byte (8-bit) integer
    end

    # add indexes!!
  end

  def self.down
    drop_table "unblocks"
    
  end
end
