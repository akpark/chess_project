class Piece

  attr_reader :board, :color
  attr_accessor :pos

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  # def inspect
  #   "X"
  # end

  # def to_s
  #   "X"
  # end

  def moves
  end

  def move_dirs
  end
end
