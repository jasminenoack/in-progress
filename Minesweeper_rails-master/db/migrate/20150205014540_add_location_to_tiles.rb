class AddLocationToTiles < ActiveRecord::Migration
  def change
    add_column :tiles, :location, :integer
    add_column :tiles, :board_id, :integer 
  end
end
