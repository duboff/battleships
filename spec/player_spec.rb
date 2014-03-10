require 'player'

describe Player do 
  let(:bob) { Player.new('Bob') }
  let(:alice) { Player.new('Alice') }
  
  it 'has a name' do 
    expect(bob.name).to eq 'Bob'
  end

  it 'has a board assigned' do
    expect(bob.board.rows).to include Array.new(10) {''}
  end

  it "should know when ships are remaining" do
    bob.board.rows[1][1] = 's'
    bob.board.rows[1][2] = 's'
    bob.board.rows[1][3] = 's'
    expect(bob).to have_ships_still_floating
  end

  it "should know when all ships are sunk" do
   bob.board.rows[1][1] = 's'
   bob.board.rows[1][2] = 's' 
   bob.board.rows[1][3] = 's'
   bob.board.register_shot [1,1]
   bob.board.register_shot [1,2]
   bob.board.register_shot [1,3]
   expect(bob).not_to have_ships_still_floating
  end

  it 'should be able to hit opponent ship' do 
    alice.board.rows[1][1] = 's'
    bob.shoot([1,1], alice.board)
    expect(alice.board.rows[1][1]).to eq 'x'
  end

  it 'should be able to miss' do
    bob.shoot([1,1], alice.board)
    expect(alice.board.rows[1][1]).to eq 'o'
  end

end