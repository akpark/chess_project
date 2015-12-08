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

end
