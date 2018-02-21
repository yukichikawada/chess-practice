require 'byebug'
require_relative 'pieces/piece.rb'
require_relative 'pieces/nullpiece.rb'
require_relative 'pieces/bishop.rb'
require_relative 'display'
require_relative 'pieces/king.rb'
require_relative 'pieces/knight.rb'
require_relative 'pieces/pawn.rb'
require_relative 'pieces/queen.rb'
require_relative 'pieces/rook.rb'

class Board
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8, "") }
    populate_board
  end

  def [](pos)
    x, y = pos
    @board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end

  def populate_board
    populate(1, "white")
    populate_pawns(0, "white")
    populate_pawns(6, "black")
    populate(7, "black")
    populate_nullpieces
  end

  def render_board
    @display = Display.new(self)
    @display.display
  end

  def populate(row, color)
    8.times do |idx|
      case idx
      when 0 , 7
        @board[row][idx] = Rook.new(color, self, [row, idx])
      when 1 , 6
        @board[row][idx] = Knight.new(color, self, [row, idx])
      when 2 , 5
        @board[row][idx] = Bishop.new(color, self, [row, idx])
      when 3
        @board[row][idx] = King.new(color, self, [row, idx])
      when 4
        @board[row][idx] = Queen.new(color, self, [row, idx])
      end
    end
  end

  def valid_pos?

  end

  def populate_pawns(row, color)
    8.times do |col|
      @board[row][col] = Pawn.new(color, self, [row, col])
    end
  end

  def populate_nullpieces
    (2..5).each do |row|
      8.times do |col|
        @board[row][col] = NullPiece.new
      end
    end
  end

  def move_piece(color, start_pos, end_pos)
    piece1 = @board[start_pos[0]][start_pos[-1]]
    piece2 = @board[end_pos[0]][end_pos[-1]]
    # if piece1.is_a? NullPiece
    #   raise "no piece"
    # if piece1.color == piece2.color
    #   raise "you already have a piece there"
    # else
      @board[end_pos[0]][end_pos[-1]] = piece1
      @board[start_pos[0]][start_pos[-1]] = NullPiece.new
    # end
  end

end
