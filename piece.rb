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

  def valid_move?(new_move)
    board.in_bounds?(new_move) &&
    (board.empty?(new_move) || !is_same_color?(board[new_move]))
  end

  protected
  def is_same_color?(other_piece)
    color == other_piece.color
  end

end
