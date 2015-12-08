require_relative 'piece'

class SlidingPiece < Piece

  def moves
    x, y = pos
    result = []
    self.move_dirs.each do |move_dir|
      1.upto(7) do |i|
        new_move = [x + (move_dir[0] * i), y + (move_dir[1] * i)]
        result << new_move if valid_move?(new_move)
        break unless board.in_bounds?(new_move) && board.empty?(new_move)
      end
    end

    result
  end

end
