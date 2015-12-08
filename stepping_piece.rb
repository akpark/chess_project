require_relative 'piece'

class SteppingPiece < Piece

  def moves
    x, y = pos
    moves = []
    self.move_dirs.each do |move_dir|
      new_move = [x + (move_dir[0]), y + (move_dir[1])]
      if board.in_bounds?(new_move) &&
        (board.empty?(new_move) || !is_same_color?(board[new_move]))
          moves << new_move
      end
    end
    moves
  end

end
