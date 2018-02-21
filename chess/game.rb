require_relative "board.rb"
require_relative "display.rb"


class Game
  attr_reader :board, :display, :players, :current_player

  def initialize(board, display, player1=nil, player2=nil)
    @board = board
    @display = display
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def play
    display.display
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  display = Display.new(board)
  game = Game.new(board, display)
  game.play
  game.board.move_piece("color", [1,0],[2,0])
  game.play
end
