
class Piece
  attr_reader :color, :board, :name

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    @name = "notnull"
  end

  def moves
    # should return array of places can move to
  end

end
