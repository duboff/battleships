class Ship

  def initialize(size)
    @size = size
    @direction = rand(2)
  end

  def size
    @size
  end

  def direction
    @direction
  end

  def horizonal?
    @direction == 0
  end

  def vertical?
    @direction == 1
  end

end