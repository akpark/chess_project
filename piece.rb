class Piece

  attr_reader :color
  attr_accessor :pos, :has_moved, :board

  def initialize(pos, board, color, has_moved = false)
    @pos = pos
    @board = board
    @color = color
    @has_moved = has_moved
  end

  def has_moved?
    has_moved
  end

  def moves
  end

  def move_dirs
  end

  def valid_move?(new_move)
    board.in_bounds?(new_move) &&
    (board.empty?(new_move) || !is_same_color?(board[new_move]))
    #  &&
    # !move_into_check?(new_move)
  end

  def is_same_color?(other_piece)
    color == other_piece.color
  end

  def move_into_check?(end_pos)
    dup_board = board.deep_dup
    dup_board.dup_move(pos, end_pos)
    dup_board.in_check?(color)
  end

  def inspect
    "Position: #{pos}, Color: #{color}, Class: #{self.class}"
  end

end
