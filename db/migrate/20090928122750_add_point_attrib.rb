class AddPointAttrib < ActiveRecord::Migration
  def self.up
    add_column :points, :attribution, :string, :default => ""
  end

  def self.down
    remove_column :points, :attribution
  end
end
