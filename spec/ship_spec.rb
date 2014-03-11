require 'ship'

describe Ship do
  let(:ship) {Ship.new(2) }
  let(:carrier) {Ship.new(5) }
  
  it 'should know its size' do
    expect(ship.size).to eq 2
  end

  it 'should choose direction at creation' do 
    fleet = Array.new(1000) { Ship.new(2) }
    times_when_horizontal = fleet.count {|ship| ship.horizontal? }
    expect(times_when_horizontal).to be_within(100).of(500)
    times_when_vertical = fleet.count {|ship| ship.vertical? }
    expect(times_when_vertical).to be_within(100).of(500) 
  end



end
