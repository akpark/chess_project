require_relative 'piece'

class SlidingPiece < Piece

  def moves
    x, y = pos
    moves = []
    1.upto(8) do |i|
      self.move_dirs.each do |move_dir|
        new_move = [x + (move_dir[0] * i), y + (move_dir[1] * i)]
        moves << new_move if board.valid_pos?(new_move)
      end
    end

    moves
  end

end
