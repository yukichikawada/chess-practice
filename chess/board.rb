require 'byebug'
require_relative 'piece'
require_relative 'nullpiece'
require_relative 'display'

class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8, "") }
    populate_board
  end

  def populate_board
    populate_first_last(0, "white")
    populate_pawns(1, "white")
    populate_pawns(6, "black")
    populate_first_last(7, "black")
    populate_nullpieces
  end

  def render_board
    @display = Display.new(self)
    @display.display
  end

  def populate_first_last(row, color)
    8.times do |pos|
      case pos
      when 0 , 7
        @board[row][pos] = Piece.new("Rook", color)
      when 1 , 6
        @board[row][pos] = Piece.new("Knight", color)
      when 2 , 5
        @board[row][pos] = Piece.new("Bishop", color)
      when 3
        @board[row][pos] = Piece.new("King", color)
      when 4
        @board[row][pos] = Piece.new("Queen", color)
      end
    end
  end

  def populate_pawns(row, color)
    8.times do |pos|
      @board[row][pos] = Piece.new("Pawn", color)
    end
  end

  def populate_nullpieces
    (2..5).each do |row|
      8.times do |col|
        @board[row][col] = NullPiece.new
      end
    end
  end

  def move_piece(start_pos, end_pos)
    piece1 = @board[start_pos[0]][start_pos[-1]]
    piece2 = @board[end_pos[0]][end_pos[-1]]
    if piece1.is_a? NullPiece
      raise "no piece"
    elsif piece1.color == piece2.color
      raise "you already have a piece there"
    else
      @board[end_pos[0]][end_pos[-1]] = piece1
      @board[start_pos[0]][start_pos[-1]] = NullPiece.new
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Board.new
  game.render_board
end
