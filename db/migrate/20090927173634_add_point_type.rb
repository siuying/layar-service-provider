class AddPointType < ActiveRecord::Migration
  def self.up
    add_column :points, :point_type, :string, :default => "0"
  end

  def self.down
    remove_column :points, :point_type
  end

end
