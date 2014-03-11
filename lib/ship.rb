class Ship

  attr_reader :size, :direction

  def initialize(size)
    @size = size
    @direction = rand(2)
  end

  def horizonal?
    @direction == 0
  end

  def vertical?
    @direction == 1
  end

end