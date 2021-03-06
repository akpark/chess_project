require_relative 'sliding_piece'

class Queen < SlidingPiece

  def move_dirs
    [
      [0,   1],
      [0,  -1],
      [1,   0],
      [1,   1],
      [1,  -1],
      [-1,  0],
      [-1,  1],
      [-1, -1]
    ]
  end

  def to_s
    "Q"
  end

end
