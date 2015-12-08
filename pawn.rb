require_relative 'piece'

class Pawn < Piece

  def move_dirs
    color == :black ? black_move_dirs : white_move_dirs
  end

  def white_move_dirs
    deltas = [
      [1, -1],
      [1,  0],
      [1,  1]
    ]

    deltas << [2, 0] if !has_moved?
    deltas
  end

  def black_move_dirs
    deltas = [
      [-1,  0],
      [-1,  1],
      [-1, -1]
    ]

    deltas << [-2, 0] if !has_moved?
    deltas
  end

  def moves
    x, y = pos
    result = []
    diagonal_move_dirs = [[-1, 1], [1, 1], [1, -1], [-1, -1]]
    move_dirs.each do |move_dir|
      new_move = [x + move_dir[0], y + move_dir[1]]
      if diagonal_move_dirs.include?(move_dir)
        result << new_move if valid_diagonal_move?(new_move)
      else
        result << new_move if valid_move?(new_move)
      end
    end

    result
  end

  def valid_diagonal_move?(move)
    !board.empty?(move) && board.in_bounds?(move) && !is_same_color?(board[move])
  end

  def valid_move?(move)
    board.empty?(move) && board.in_bounds?(move)
  end

  def to_s
    "P"
  end

end
