# frozen_string_literal: true

# The player is a base class for the computer and the actual player
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

# The computer class is a player that has the opposite symbol
class Computer < Player
  def initialize(player_symbol)
    super('Computer', computer_symbol(player_symbol))
  end

  private

  def computer_symbol(player_symbol)
    player_symbol == 'X' ? 'O' : 'X'
  end
end
