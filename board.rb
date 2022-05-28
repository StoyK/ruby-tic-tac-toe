# frozen_string_literal: true

WIN_COMBINATIONS = [
  [0, 1, 2], # top_row
  [3, 4, 5], # middle_row
  [6, 7, 8], # bottom_row
  [0, 3, 6], # left_column
  [1, 4, 7], # center_column
  [2, 5, 8], # right_column
  [0, 4, 8], # left_diagonal
  [6, 4, 2] # right_diagonal
].freeze

# The board keeps track of the tiles
class Board
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # Checks if the wanted index isn't already played
  def valid_move?(index)
    index.between?(1, 9) && board[index - 1].is_a?(Integer)
  end

  def move(index, player)
    @board[index] = player
  end

  def display
    puts %(
    #{@board[0]} | #{@board[1]} | #{@board[2]}
    ---------
    #{@board[3]} | #{@board[4]} | #{@board[5]}
    ---------
    #{@board[6]} | #{@board[7]} | #{@board[8]}
    )
  end

  def filled?
    @board.all? { |tile| !tile.is_a?(Integer) }
  end

  def game_over?
    WIN_COMBINATIONS.any? do |line|
      [board[line[0]], board[line[1]], board[line[2]]].uniq.length == 1
    end
  end
end
