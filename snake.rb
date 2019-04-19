# require_relative 'game'

class Snake
  attr_accessor :size
  attr_accessor :y
  attr_accessor :x
  attr_accessor :w
  attr_accessor :h
  attr_accessor :direction_y
  attr_accessor :direction_x
  attr_accessor :speed

  def initialize
    @w = 50
    @h = 50
    @x = rand(799)
    @y = rand(599)
    @size = 20
    @speed = 5
    @image = Gosu::Image.new("./lib/media/snake3.png")
    @direction_x = 0
    @direction_y = 0
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

  def go_left
    @direction_x = -1
    @direction_y = 0
  end

  def go_up
    @direction_y = -1
    @direction_x = 0
  end

  def go_down
    @direction_y = 1
    @direction_x = 0
  end

  def go_right
    @direction_x = 1
    @direction_y = 0
  end

  def move
    @x += @speed * @direction_x
    @y += @speed * @direction_y
    # game.dead = false

    # @direction_x = 1 if @x <= 1
    # @direction_x = -1 if @x >= 799
    # @direction_y = 1 if @y <= 1
    # @direction_y = - 1 if @y >= 599
  end

  def collide?(other)
    x_overlap = [0, [right, other.right].min - [left, other.left].max].max
    y_overlap = [0, [bottom, other.bottom].min - [top, other.top].max].max
    x_overlap * y_overlap != 0
  end
end

class Food
  attr_accessor :y
  attr_accessor :x
  attr_accessor :w
  attr_accessor :h

  def initialize
    @w = 50
    @h = 50
    @x = rand(799)
    @y = rand(599)
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
