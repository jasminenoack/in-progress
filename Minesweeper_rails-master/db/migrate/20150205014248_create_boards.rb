class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.boolean :alive
      t.integer :rows
      t.integer :columns
      t.integer :bombs


      t.timestamps
    end
  end
end
