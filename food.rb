class Food
  attr_reader :shape

  def initialize
    @ate = false
    @shape = Square.new(rand(ROWS) * PIXEL_SIZE, rand(COLS) * PIXEL_SIZE, PIXEL_SIZE, 'red')
  end

  def eat
    @ate = true
  end

  def refresh
    return self unless @ate
    nil
  end
end
