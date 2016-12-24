class Snake
  def initialize
    @tail = []
    direct(0, 1)
    grow
  end

  def direct(x, y)
    return if x == 1 && @x_speed == -1
    return if x == -1 && @x_speed == 1
    return if y == 1 && @y_speed == -1
    return if y == -1 && @y_speed == 1
    @x_speed = x
    @y_speed = y
  end

  def head
    @tail[0]
  end

  def grow(x = rand(COLS) * PIXEL_SIZE, y = rand(ROWS) * PIXEL_SIZE)
    @tail << Square.new(x, y, PIXEL_SIZE, 'white')
    puts @tail.size
  end

  def eat(f)
    return if f.shape.x != head.x
    return if f.shape.y != head.y
    f.eat
    grow(f.shape.x, f.shape.y)
  end

  def update_position
    new_x = head.x + @x_speed * PIXEL_SIZE
    new_y = head.y + @y_speed * PIXEL_SIZE
    if new_x < WIDTH && new_x >= 0
      @tail.size.downto(0) do |i|
        @tail[i - 1].x = @tail[i - 2].x unless i ==0 || @tail.size == 1
        head.x = new_x if i == 0
      end
    end
    if new_y < HEIGHT && new_y >= 0
      @tail.size.downto(0) do |i|
        @tail[i - 1].y = @tail[i - 2].y unless i ==0 || @tail.size == 1
        head.y = new_y if i == 0
      end
    end
  end
end
