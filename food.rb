class Food
  attr_accessor :y
  attr_accessor :x
  attr_accessor :w
  attr_accessor :h

  def initialize
    @w = 50
    @h = 50
    @x = rand(50..650)
    @y = rand(50..500)
    @image = Gosu::Image.new("./lib/media/snake_food.jpeg")
  end

  def left
    @x
  end

  def right
    @x + @w
  end

  def right=(r)
    self.x = r - @w
  end

  def top
    @y
  end

  def top=(t)
    self.y = t
  end

  def bottom
    @y + @h
  end

  def center_y
    @y + @h / 2
  end

  def center_x
    @x + @x / 2
  end

  def bottom=(b)
    self.y = b - @h
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end
end
