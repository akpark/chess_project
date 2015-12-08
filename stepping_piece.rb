require_relative 'piece'

class SteppingPiece < Piece

  def moves
    x, y = pos
    result = []
    self.move_dirs.each do |move_dir|
      new_move = [x + (move_dir[0]), y + (move_dir[1])]
      result << new_move if valid_move?(new_move)
    end

    result
  end

end
