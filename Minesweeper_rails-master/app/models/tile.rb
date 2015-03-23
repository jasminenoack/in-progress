class Tile < ActiveRecord::Base
  belongs_to(
    :board,
    class_name: "Board",
    foreign_key: :board_id,
    primary_key: :id
  )

  has_many :tiles, through: :board, source: :tiles

  def commandline_display(tiles, rows, columns)
    if flagged
      'F'
    elsif !revealed
      '-'
    else
      if bombed
        'B'
      else
        neighbors(rows, columns, tiles)
          .select { |tile| tile.bombed == true }
          .count
          .to_s
      end
    end
  end

  def reveal!
    self.revealed = true
    self.save
  end

  def flag!
    self.flagged = true
    self.save
  end

  def unflag!
    self.flagged = false
    self.save
  end

  def neighbors(row_length, column_length, tiles)
    neighbor_tiles = []
    validate_neighbors(row_length, column_length).each do |location|
      neighbor_tiles << tiles[location]
    end
    neighbor_tiles
  end


  def validate_neighbors(row_length, column_length)
    deltas = create_neighbors(row_length)
    neighbors = deltas.map { |delta| delta + location}
    board_tiles = (row_length * column_length) - 1

    neighbors.select do |neighbor_location|
      neighbor_location.between?(0,board_tiles) &&
         neighbor_location != location &&
         !(neighbor_location % row_length == 0 &&
           (location + 1) % row_length == 0 &&
           location != 0 ) &&
         !((neighbor_location + 1) % row_length == 0 &&
          location % row_length == 0 )
    end
  end

  def create_neighbors(row_length)
    row_movement = [-row_length, 0, row_length ]
    column_movement = [-1, 0, 1]
    deltas = []

    column_movement.each do |column_change|
      deltas += row_movement.map { |row_change| row_change + column_change }
    end

    deltas
  end


end
