
module Stepable

  def moves

  end

  def move_diffs

  end

  def get_knight_moves(start_pos)
    result = []
    x, y = start_pos
    result << [x + 2, y + 1]
    result << [x + 2, y - 1]
    result << [x - 2, y + 1]
    result << [x - 2, y - 1]
    result << [x + 1, y + 2]
    result << [x - 1, y + 2]
    result << [x + 1, y - 2]
    result << [x - 1, y - 2]
    remove_impossible_moves(result)
  end

  def get_king_moves(start_pos)
    result = []
    x, y = start_pos
    result << [x + 1, y + 1]
    result << [x + 1, y - 1]
    result << [x - 1, y + 1]
    result << [x - 1, y - 1]
    result << [x, y - 1]
    result << [x, y + 1]
    result << [x + 1, y]
    result << [x - 1, y]
    remove_impossible_moves(result)
  end






  def remove_impossible_moves(moves)
    moves.reject! do |moves|
      moves.any? {|pos| pos < 0 || pos > 7}
    end
  end

end
