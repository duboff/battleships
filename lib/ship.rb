class Ship

  attr_reader :size, :direction
  attr_accessor :coords

  def initialize(size)
    @size = size
    @direction = rand(2)
    @coords = []
  end

  def horizontal?
    @direction == 0
  end

  def vertical?
    @direction == 1
  end


end