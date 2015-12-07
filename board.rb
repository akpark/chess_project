require_relative 'piece'
require_relative 'display'
require_relative 'player'
require_relative 'piece'
require_relative 'sliding_piece'
require_relative 'bishop'

class Board
  # include Cursorable

  FIRST_ROW = Array.new(9) { Piece.new(nil, self) }
  SECOND_ROW = Array.new(9) { Piece.new(nil, self) }

  def self.make_grid
    grid = Array.new(9) { Array.new(9," ") }
    #grid[0],grid[1], grid[-1],grid[-2]
    #grid[0] reverse of grid[-1], grid[1] == grid[-2]
    grid[0] = FIRST_ROW
    grid[-1] = FIRST_ROW.reverse
    grid[1] = SECOND_ROW
    grid[-2] = SECOND_ROW
    grid
  end

  attr_accessor :grid

  def initialize(grid = Board.make_grid)
    @grid = grid
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
