class Piece

  attr_reader :board
  attr_accessor :pos

  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def inspect
    "X"
  end

  def to_s
    "X"
  end

  def moves
  end

  def move_dirs
  end
end
