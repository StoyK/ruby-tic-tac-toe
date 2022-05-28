# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# The game class is the main class of the program
class Game
  attr_reader :board, :curr_turn, :player, :computer

  def initialize
    @board = Board.new
    @curr_turn, @player, @computer = nil
  end

  def choose_symbol
    print 'Enter what symbol to use (X or O): '
    symbol = gets.chomp
    return symbol if %w[X O].any? { |elem| symbol == elem }

    puts "Choose between X and O, #{symbol} is not valid!"
    choose_symbol
  end

  # @todo implement better AI, than guess until it does something
  def computer_turn
    input = rand(1..9)
    return input if board.valid_move?(input)

    computer_turn
  end

  def player_turn
    print 'Choose a number on the board: '
    input = gets.chomp.to_i
    return input if board.valid_move?(input)

    puts 'This isn\'t a valid tile'
    player_turn
  end

  def init_game
    print 'Enter name: '
    name = gets.chomp
    symbol = choose_symbol

    @player = Player.new name, symbol
    @computer = Computer.new symbol
  end

  def curr_input
    @curr_turn.is_a?(Computer) ? computer_turn : player_turn
  end

  def turn
    input = curr_input
    board.move(input - 1, curr_turn.symbol)
    board.display
  end

  def switch_players
    @curr_turn == player ? computer : player
  end

  def play_game
    @curr_turn = @player
    until board.filled?
      turn
      break if board.game_over?

      @curr_turn = switch_players
    end
  end

  def end_game
    if board.game_over?
      puts "#{@curr_turn.symbol} wins"
    else
      puts "It's a tie"
    end
  end

  def start
    init_game
    board.display
    play_game
    end_game
  end
end
