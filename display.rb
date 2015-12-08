require 'colorize'
require_relative "cursorable"

class Display
  include Cursorable

  attr_reader :board

  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
    @selected = false
  end

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      piece = " " if piece.nil?
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :cyan
    elsif (i + j).odd?
      bg = :light_red
    else
      bg = :red
    end
    if board[[i, j]].is_a?(Piece) && board[[i, j]].color == :white
      text_color = :light_white
    else
      text_color = :black
    end
    { background: bg, color: text_color }
  end

  def inspect
  end

  def render
    system("clear")
    puts "Arrow keys, WASD, or vim to move, space or enter to select."
    build_grid.each { |row| puts row.join }
  end

end
