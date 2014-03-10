require 'board'

describe Board do 

  let(:board) {Board.new}

  it 'knows a shot at the empty space is a shot in the water' do 
    board.register_shot_at_coordinates(0, 0) 
    expect(board.rows[0][0]).to eq 'o'
  end

  it 'should know when it has hit a ship' do
    board.rows[1][1] = 's'
    board.register_shot_at_coordinates(1,1)
    expect(board.rows[1][1]).to eq 'x'
  end

  it 'know when oponent tries to hit a square they already hit' do 
    board.rows[2][2] = 'x'
    expect(lambda { board.register_shot_at_coordinates(2,2) }).to raise_error(RuntimeError)
  end

  it 'know when oponent tries to hit a square they already hit' do 
    board.rows[1][2] = 'o'
    expect(lambda { board.register_shot_at_coordinates(1,2) }).to raise_error(RuntimeError)
  end


end