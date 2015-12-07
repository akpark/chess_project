require_relative 'sliding_piece'

class Bishop < SlidingPiece

  # def initialize
  #   super
  # end

  DELTAS = [
    [1,   1],
    [-1,  1],
    [-1, -1],
    [1,  -1]
  ]

  def moves(pos)
    x, y = pos
    moves = []
    1.upto(8) do |i|
      DELTAS.each do |delta|
        new_move = [x + (delta[0] * i), y + (delta[1] * i)]
        moves << new_move if board.valid_pos?(new_move)
      end
    end
    moves
  end

end
