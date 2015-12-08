require_relative 'piece'

class SteppingPiece < Piece

  def moves
    x, y = pos
    moves = []
    self.move_dirs.each do |move_dir|
      new_move = [x + (move_dir[0]), y + (move_dir[1])]
      moves << new_move if board.in_bounds?(new_move)
    end
    moves
  end

end
