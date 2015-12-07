require_relative 'piece'

class Pawn < Piece

  attr_accessor :has_moved

  def initialize(pos, board, color, has_moved = false)
    super(pos, board, color)
    @has_moved = has_moved
  end

  def has_moved?
    has_moved
  end

  def move_dirs
    has_moved? ? [[0, 1]] : [[0, 1], [0, 2]]
  end

  def moves
    x, y = pos
    moves = []
    move_dirs.each do |move_dir|
      new_move = [x + move_dir[0], y + move_dir[1]]
      moves << new_move if board.valid_pos?(new_move)
    end
    moves
  end

  def to_s
    "P"
  end

end
