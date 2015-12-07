require_relative 'piece'

class SlidingPiece < Piece

  def moves
    self.class.moves
  end


end
