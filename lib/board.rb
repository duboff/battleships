require_relative "./ship.rb"

class Board
  attr_reader :player
  attr_accessor :rows, :ships


  def initialize player
      @player = player
      @rows = Array.new(10) { Array.new(10, '') }
      @ships = fill_ships
  end
  
  def owner
    player.name
  end

  def fill_ships
    [1,1,1,1,2,2,2,3,3,4].map {|size| Ship.new(size) }
  end

  def place_ship
    # loop through ships, put it randomly on a board, check that position is legal and move on
    # ship = ships[0]
    
    # ships.each do |ship|
    rows[0][0] = 's'
    rows[5][7] = 's'
    rows[3][3] = 's'
    rows[4][4] = 's'

    rows[9][0] = 's'
    rows[9][1] = 's'
    rows[9][2] = 's'
    rows[9][3] = 's'

    rows[7][1] = 's'
    rows[7][2] = 's'
    rows[7][3] = 's'

    rows[0][9] = 's'
    rows[1][9] = 's'
    rows[2][9] = 's'

    rows[7][8] = 's'
    rows[8][8] = 's'

    rows[2][1] = 's'
    rows[3][1] = 's'  

    rows[3][8] = 's'
    rows[4][8] = 's'
    
    #   ship_coords = []
    #   ship_coords << [rand(10), rand(10)]
    #   (ship.size-1).times do
    #   ship_coords << [ship_coords.last[0] + 1, ship_coords.last[1]]  if ship.vertical?
    #   ship_coords << [ship_coords.last[0], ship_coords.last[1] + 1] if ship.horizontal?
    #   end
    #   # ship_coords.each do |coord|
    #   #   if rows[coord[0]][coord[1]] == 's' 
    #   # end
    #   # if rows[coords[0]][coords[1]] == 's'
      
    #   # ship.coords += ship_coords


    #   ship_coords.each {|coords| rows[coords[0]][coords[1]] = 's' }
 
    # end
  end


  # This method should register the shot at the coordinates passed
  # hitting a ship or
  # just hitting the water.

  def register_shot at_coordinates
    x, y = at_coordinates[0], at_coordinates[1]
    case rows[x][y]
    when ''
      rows[x][y] = 'o'
    when 's'
      rows[x][y] = 'x'
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

    # This method returns an array containing 10 arrays with 10
  # elements each (as in rows) replacing the ships with an empty
  # string ('') so that your opponent cannot see your ships.

  def opponent_view
    board = rows
    board.each do |row|
      row.each { |cell| cell.gsub!('s', '') }
    end
    board
  end

end

# board = Board.new(Player.new('Bob'))

