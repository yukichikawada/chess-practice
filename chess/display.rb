require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def display
    system("clear")
    8.times do |row|
      8.times do |col|
        if @cursor.cursor_pos == [row, col]
          print "  #{@board.board[row][col].name}  ".red
        else
          print "  #{@board.board[row][col].name}  "
        end
      end
      puts
      puts
    end
    @cursor.get_input
    display
  end

end
