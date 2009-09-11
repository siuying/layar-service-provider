class CreatePoints < ActiveRecord::Migration
  def self.up
    create_table :points do |t|
      t.string "group"
      t.string "name"
      t.string "address"
      t.string "phone"
      t.string "state"
      t.decimal "lat"
      t.decimal "lng"      
      
      t.datetime "created_at"
      t.datetime "updated_at"
      
      t.timestamps
    end
    
    add_index :points, :group
  end

  def self.down
    drop_table :points
  end
end
