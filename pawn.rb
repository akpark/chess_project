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
    deltas = [
      [-1, 1],
      [ 0, 1],
      [ 1, 1]
    ]

    deltas << [0,2] if !has_moved?
  end

  def moves
    x, y = pos
    moves = []
    diagonal_moves = [[-1,1], [1,1]]
    move_dirs.each do |move_dir|
      new_move = [x + move_dir[0], y + move_dir[1]]
      if diagonal_moves.include?(move_dir)
        moves << new_move if valid_diagonal_move?(new_move)
      else
        moves << new_move if valid_move?(new_move)
      end
    end

    moves
  end

  def valid_diagonal_move?
    !board.empty?(new_move) && !is_same_color?(board[new_move])
  end

  def to_s
    "P"
  end

end
