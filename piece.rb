class Piece

  attr_reader :board, :piece_color
  attr_accessor :pos

  def initialize(pos, board, piece_color)
    @pos = pos
    @board = board
    @piece_color = piece_color
  end

  def moves
  end

  def move_dirs
  end

  def valid_move?(new_move)
    board.empty?(new_move) || !is_same_color?(board[new_move])
  end

  def is_same_color?(other_piece)
    piece_color == other_piece.piece_color
  end

end
