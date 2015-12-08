
require 'byebug'

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
      when 4
        row[col_index] = Queen.new(pos, self, color)
      when 3
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

  def in_bounds?(pos)
    pos.none? { |el| el < 0 || el > 7 }
  end

  def move(start_pos, end_pos)
    if !self[start_pos].nil? && self[start_pos].moves.include?(end_pos)
      self[start_pos], self[end_pos] = nil, self[start_pos]
      self[end_pos].has_moved = true
      self[end_pos].pos = end_pos
    else
      raise InvalidMoveError
    end
  end


  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    grid[x][y] = piece
  end

  def in_check?(color)
    king_coords = find_king_coords(color)
    grid.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        pos = [row_index, col_index]
        square = self[pos]
        if square.is_a?(Piece) && square.color != color
          return true if square.moves.include?(king_coords)
        end
      end
    end

    false
  end

  def find_king_coords(color)
    grid.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        pos = [row_index, col_index]
        piece = self[pos]
        return pos if piece.is_a?(King) && piece.color == color
      end
    end
  end

  def checkmate?(color)
    return false if !in_check?(color)
    grid.flatten.all? do |square|
      if square.is_a?(Piece) && square.color == color
        square.moves.empty?
      else
        true
      end
    end

    false
  end
end

class PositionError < StandardError
end

class InvalidMoveError < StandardError
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
