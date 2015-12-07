require_relative 'piece'
require_relative 'display'
require_relative 'player'
require_relative 'piece'
require_relative 'sliding_piece'
require_relative 'bishop'
require_relative 'queen'
require_relative 'rook'

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }
    populate_grid
  end

  def populate_grid
    grid.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        pos = [row_index, col_index]
        case row_index
        when 1
          self[pos] = Pawn.new(pos, self, :white)
        when 7
          self[pos] = Pawn.new(pos, self, :black)
        when 0
          if col_index
        when 8


  end

  def create_outside_row(color)
    row = Array.new(8)
    row_idx = color == :white ? 0 : 8
    row.each_index do |col_index|
      pos = [row_idx, col_index]
      case col_index
      when 0, 8
        row[col_index] = Rook.new(pos, self, color)
      when 1, 7
        row[col_index] = Knight.new(pos, self, color)
      when 2, 6
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
    row_idx = color == :white ? 1 : 7
    row = Array.new(9)
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
    #there's already a piece
    raise InvalidPositionError unless valid_pos?(start_pos) && valid_pos?(end_pos)
    #get the piece at start position and move it to end position
    self[start_pos], self[end_pos] = nil, self[start_pos]
  end

  def valid_pos?(pos)
    pos.none? { |el| el < 0 || el > 8 }
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    grid[x][y] = piece
  end

  def in_bounds?(pos)
    true
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
