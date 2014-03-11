require 'board'

describe Board do 

  let(:board) {Board.new(Player.new('Bob'))}

  it 'knows a shot at the empty space is a shot in the water' do 
    board.empty_the_board
    board.register_shot [0, 0] 
    expect(board.rows[0][0]).to eq 'o'
  end

  it 'should know when it has hit a ship' do
    board.empty_the_board
    board.rows[1][1] = 's'
    board.register_shot [1,1]
    expect(board.rows[1][1]).to eq 'x'
  end

  it 'know when oponent tries to hit a square they already hit' do 
    board.empty_the_board
    board.rows[2][2] = 'x'
    expect(lambda { board.register_shot [2,2] }).to raise_error(RuntimeError)
  end

  it 'know when oponent tries to hit a square they already hit' do 
    board.empty_the_board
    board.rows[1][2] = 'o'
    expect(lambda { board.register_shot [1,2] }).to raise_error(RuntimeError)
  end

  it "doesn't show the ships to the opponent" do 
    board.empty_the_board
    board.rows[1][1] = 's'
    expect(board.opponent_view[1][1]).to eq ''
  end

  it 'should have 0 carrier' do 
    carriers = board.ships.count {|ship| ship.size == 4}
    expect(carriers).to eq 1
  end

  it 'should have 1 destroyers' do
    destroyers = board.ships.count {|ship| ship.size == 3}
    expect(destroyers).to eq 2
  end

  it 'should have 2 submrines' do
    submarines = board.ships.count {|ship| ship.size == 2}
    expect(submarines).to eq 3
  end

  it 'should have 3 gunboats' do
    gunboats = board.ships.count {|ship| ship.size == 1}
    expect(gunboats).to eq 4
  end

  it "knows player's name" do 
    expect(board.owner).to eq 'Bob'
  end

  # it 'can place 1 ship' do 
  #   board.place_ships
  #   expect(board.ships[0].coords).not_to be_empty
  # end
  it 'knows where the ship is placed' do 
    board.ships[0].coords << board.get_ship_coords(board.ships[0])
    expect(board.ships[0].coords).not_to be_empty
  end
  
  xit 'knows where the ship is placed' do 
    board.place_ships
    expect(board.rows.flatten.count('s')).to eq 20
  end

  it "shouldn't modify my board when look at opponent's board" do 
    rows1 = board.rows.dup
    board.opponent_view
    expect(board.rows).to eq rows1
  end

  it 'should be able to empty the board' do 
    board.empty_the_board
    expect(board.rows.flatten.count('s')).to eq 0
  end

end



