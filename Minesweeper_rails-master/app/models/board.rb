class Board < ActiveRecord::Base
  has_many(
    :tiles,
    class_name: "Tile",
    foreign_key: :board_id,
    primary_key: :id
  )

  def self.setup_beginner!
    board = Board.create(alive: true, columns: 9, rows: 9, bombs: 10)
    num_tiles = board.rows * board.columns

    num_tiles.times do |i|
      Tile.create(
        bombed: false,
        revealed: false,
        flagged: false,
        location: i,
        board_id: board.id
      )
    end
    (0...num_tiles).to_a.sample(board.bombs).each do |index|
      tile = Tile.where(board_id: board.id, location: index).first
      tile.bombed = true
      tile.save
    end

    self
  end

  def commandline_display
    display_string = ""
    tiles = find_tiles_in_order
    rows = self.rows
    columns = self.columns

    tiles.each_slice(9) do |row|
      row.each do |tile|
        display_string << tile.commandline_display(tiles, rows, columns)
        display_string << " "
      end
      display_string << "\n"
    end
    display_string
  end

  def find_tiles_in_order
    self.tiles.order(:location)
  end



end
