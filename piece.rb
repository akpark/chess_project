class Piece

  attr_reader :board
  attr_accessor :pos

  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def inspect
    name
  end

  def to_s
    "#{name}"
  end

  def moves
    self.class.moves
  end

end
