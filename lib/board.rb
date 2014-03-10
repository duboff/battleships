class Board
  attr_accessor :rows

  def initialize
  #   @player = player
      @rows = Array.new(10) {Array.new(10) {''} }
  end
  
  def owner
    @player.name
  end
  

  # This method should register the shot at the coordinates passed
  # hitting a ship or
  # just hitting the water.

  def register_shot_at_coordinates(x, y)
    case @rows[x][y]
    when ''
      @rows[x][y] = 'o'
    when 's'
      @rows[x][y] = 'x'
    when 'x'
      raise 'You already hit that spot'
    when 'o'
      raise 'You already hit that spot'  
    end

  end



  # This method returns an array containing 10 arrays with 10 
  # elements each where:
  # - an empty string ('') denotes an empty space in the grid
  # - an 'o' denotes a shot in the water
  # - an 'x' denotes a hit on a ship
  # - an 's' denotes a ship
  # you can change the representations as you please, but make sure
  # that you have
  # four different types

#     # This method returns an array containing 10 arrays with 10
#   # elements each (as in rows) replacing the ships with an empty
#   # string ('') so that your opponent cannot see your ships.
#   def opponent_view
#   end
end

# board = Board.new
# p board.rows