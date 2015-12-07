class Piece

  attr_reader :board, :color
  attr_accessor :pos

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def moves
  end

  def move_dirs
  end

  protected
  def is_same_color?(other_piece)
    color == other_piece.color
  end
  
end
