module Slideable

  def get_rook_moves(start_pos)
    horizontal_valid_moves(start_pos) + vertical_valid_moves(start_pos)
  end

  def get_bishop_moves(start_pos)
    diagonal_moves(start_pos)
  end


  def remove_impossible_moves(moves)
    moves.reject! do |moves|
      moves.any? {|pos| pos < 0 || pos > 7}
    end
  end

  def horizontal_valid_moves(start_pos)
    valid_moves = []
    x, y = start_pos
    (0..7).each do |idx|
      valid_moves << [x, y + idx]
      break unless @board[valid_moves[-1]].is_a? NullPiece
    end
    (0..-7).each do |idx|
      valid_moves << [x, y + idx]
      break unless @board[valid_moves[-1]].is_a? NullPiece
    end

    remove_impossible_moves(valid_moves) - start_pos
  end

  def vertical_valid_moves(start_pos)
    valid_moves = []
    x, y = start_pos
    (0..7).each do |idx|
      valid_moves << [x + idx, y]
      break unless @board[valid_moves[-1]].is_a? NullPiece
    end
    (0..-7).each do |idx|
      valid_moves << [x + idx, y]
      break unless @board[valid_moves[-1]].is_a? NullPiece
    end

    remove_impossible_moves(valid_moves) - start_pos
  end

  def diagonal_moves(start_pos)
    valid_moves = []
    x, y = start_pos
    (0..7).each do |idx|
      valid_moves << [x + idx, y + idx]
      break unless @board[valid_moves[-1]].is_a? NullPiece
    end
    (0..-7).each do |idx|
      valid_moves << [x - idx, y - idx]
      break unless @board[valid_moves[-1]].is_a? NullPiece
    end
    x, y = start_pos
    (0..7).each do |idx|
      valid_moves << [x - idx, y + idx]
      break unless @board[valid_moves[-1]].is_a? NullPiece
    end
    (0..-7).each do |idx|
      valid_moves << [x + idx, y - idx]
      break unless @board[valid_moves[-1]].is_a? NullPiece
    end

    remove_impossible_moves(valid_moves) - start_pos
  end

  # def all_rook_moves(start_pos)#, board)
  #   x = start_pos[0]
  #   y = start_pos[-1]
  #   horizontal_moves = []
  #   vertical_moves = []
  #   8.times do |idx|
  #     idx +=1
  #     vertical_moves << [x,idx]
  #     horizontal_moves << [idx,y]
  #   end
  #
  #   [[horizontal_moves - start_pos], [vertical_moves - start_pos]]
  # end

  # def all_bishop_moves(start_pos)
  #   all_moves = []
  #   x = start_pos[0]
  #   y = start_pos[-1]
  #   8.times do |idx|
  #     idx += 1
  #     all_moves << [x+idx, y+idx]
  #     all_moves << [x-idx, y-idx]
  #     all_moves << [x+idx, y-idx]
  #     all_moves << [x-idx, y+idx]
  #   end
  #
  #   remove_impossible_moves(all_moves) - start_pos
  # end

end
