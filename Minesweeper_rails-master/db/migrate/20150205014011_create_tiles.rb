class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.boolean :bombed
      t.boolean :revealed
      t.boolean :flagged


      t.timestamps
    end
  end
end
