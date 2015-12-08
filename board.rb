require_relative 'piece'
require_relative 'display'
require_relative 'sliding_piece'
require_relative 'bishop'
require_relative 'queen'
require_relative 'rook'
require_relative 'knight'
require_relative 'king'
require_relative 'pawn'

class Board

  attr_accessor :grid

  def initialize

    @grid = Array.new(8) { Array.new(8) }
    populate_grid
  end

  def populate_grid
    grid.each_with_index do |row, row_index|
      case row_index
      when 0
        grid[row_index] = create_outside_row(:white)
      when 1
        grid[row_index] = create_inside_row(:white)
      when 6
        grid[row_index] = create_inside_row(:black)
      when 7
        grid[row_index] = create_outside_row(:black)
      else
        grid[row_index] = Array.new(8)
      end
    end
  end

  def create_outside_row(color)
    row = Array.new(8)
    row_idx = color == :white ? 0 : 7
    row.each_index do |col_index|
      pos = [row_idx, col_index]
      case col_index
      when 0, 7
        row[col_index] = Rook.new(pos, self, color)
      when 1, 6
        row[col_index] = Knight.new(pos, self, color)
      when 2, 5
        row[col_index] = Bishop.new(pos, self, color)
      when 3
        row[col_index] = Queen.new(pos, self, color)
      when 4
        row[col_index] = King.new(pos, self, color)
      end
    end
    row
  end

  def create_inside_row(color)
    row_idx = color == :white ? 1 : 6
    row = Array.new(8)
    row.each_index do |col_index|
      pos = [row_idx, col_index]
      row[col_index] = Pawn.new(pos, self, color)
    end
    row
  end

  def empty?(pos)
    self[pos].nil?
  end

  def move(start_pos, end_pos)
    raise EmptyStartPositionError if empty?(start_pos)
    unless in_bounds?(start_pos) && in_bounds?(end_pos)
      raise InvalidPositionError
    end

    self[start_pos], self[end_pos] = nil, self[start_pos]
  end

  def in_bounds?(pos)
    pos.none? { |el| el < 0 || el > 7 }
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    grid[x][y] = piece
  end
end

class PositionError < StandardError
end

class EmptyStartPositionError < PositionError
  def message
    "The start position is empty."
  end
end

class InvalidPositionError < PositionError
  def message
    "The position is not on the board."
  end
end
