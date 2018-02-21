require_relative "piece"

class Pawn < Piece
  attr_reader :first_step

  def initialize(color, board, pos)
    super(color, board, pos)
    @first_step = true
  end

  def forward_direction
    return  1 if @color == "black"
    return -1 if @color == "white"
  end

  def forward_steps
    x, y = pos
    new_pos = [x, y + forward_direction]
    @board.move_piece(@color, @pos, new_pos)
    @pos = new_pos
  end

  def side_attacks

  end

  def at_start_row?
    if @pos[1] == 1 || @pos[6] == 6
      true
    else
      false
    end
  end


end
