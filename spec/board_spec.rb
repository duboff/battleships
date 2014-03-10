require 'board'

describe Board do 

  let(:board) {Board.new}

  it 'knows a shot at the empty space is a shot in the water' do 
    board.register_shot_at_coordinates(0, 0) 
    expect(board.rows[0][0]).to eq 'o'
  end


end