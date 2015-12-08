require_relative 'piece'

class SlidingPiece < Piece

  def moves
    x, y = pos
    moves = []
    self.move_dirs.each do |move_dir|
      1.upto(8) do |i|
        new_move = [x + (move_dir[0] * i), y + (move_dir[1] * i)]
        if board.in_bounds?(new_move)
          if board.empty?(new_move)
            moves << new_move
          else
            other_piece = board[new_move]
            moves << new_move if !is_same_color?(other_piece)
            break
          end
        end
      end
    end
    moves
  end

  def get_valid_moves(moves)

  end

end
