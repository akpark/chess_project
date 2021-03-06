require_relative 'stepping_piece'

class King < SteppingPiece

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
    "K"
  end

end
