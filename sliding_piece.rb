require_relative 'piece'

class SlidingPiece < Piece

  def moves
    x, y = pos
    moves = []
    self.move_dirs.each do |move_dir|
      1.upto(8) do |i|
        new_move = [x + (move_dir[0] * i), y + (move_dir[1] * i)]
        moves << new_move if valid_move?(new_move)
        break unless board.empty?(new_move)
      end
    end
    moves
  end

  def valid_move?(new_move)
    board.in_bounds?(new_move) &&
    (board.empty?(new_move) || !is_same_color?(board[new_move]))
  end

end
