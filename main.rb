# frozen_string_literal: true

require_relative 'game'

def play_again?
  print 'Play again? '
  start_game if gets.chomp.downcase == 'y'
end

def start_game
  game = Game.new
  game.start
  play_again?
end

start_game
