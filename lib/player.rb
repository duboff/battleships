require_relative "./board.rb"

class Player
  attr_reader :name

  # Initializes a new player with her/his name.
  #
  # You will have to create a board in there and randomize the
  # positioning of your ships on the board.
  def initialize name
    @name = name
    @board = Board.new(self)
    @rows = @board.rows
  end

  def board
    @board
  end

  def rows
    board.rows
  end
  
  # Tells us if there are still ships that have not been hit
  # on her/his board.
  def has_ships_still_floating?
    rows.flatten.include?('s')
  end
  
  # Shoots at the opponents board.
  def shoot(at_coordinates, opponent_board)
    opponent_board.register_shot at_coordinates
  end

end

# player = Player.new('Bob')
# p player.board.rows