require_relative 'piece'
require_relative 'display'
require_relative 'sliding_piece'
require_relative 'bishop'
require_relative 'queen'
require_relative 'rook'
require_relative 'knight'
require_relative 'king'
require_relative 'pawn'
require_relative 'board'

class Game
  include Cursorable

  attr_reader :board, :display

  def initialize(board = Board.new)
    @board = board
    @display = Display.new(board)
  end

  def test_run
    move_positions = []

    loop do
      begin
      move_positions.clear if move_positions.length >= 2
      display.render
      input = display.get_input
      if move_positions.length == 0
        move_positions << input if !input.nil? && !board[input].nil?
      elsif move_positions.length == 1 && !input.nil?
        move_positions << input
      end
      p move_positions
      if move_positions.length == 2
        p board[move_positions[0]].moves
        board.move(*move_positions)
      end
      rescue InvalidMoveError => e
        puts e.message
        retry
      end
    end
  end

end
