require 'Gosu'
require_relative 'snake'
require_relative 'food'

class Game < Gosu::Window
  attr_reader :width, :height
  attr_reader :dead

  def initialize
    @snake = Snake.new
    @food = Food.new
    @width = 800
    @height = 600
    super(@width, @height, false)
    self.caption = "Super Deadly Snake Game"
    @font = Gosu::Font.new(self, Gosu::default_font_name, 120)
    @score_draw = Gosu::Font.new(self, Gosu::default_font_name, 40)
    @dead = false
    @score = 0
    @die_sound = Gosu::Sample.new("./lib/media/die.wav")
    @eat_sound = Gosu::Sample.new("./lib/media/eat.wav")
  end

  def update
    if Gosu.button_down? Gosu::KB_LEFT
      @snake.go_left
    elsif Gosu.button_down? Gosu::KB_RIGHT
      @snake.go_right
    elsif Gosu.button_down? Gosu::KB_UP
      @snake.go_up
    elsif Gosu.button_down? Gosu::KB_DOWN
      @snake.go_down
    end

    @snake.move
    if snake_on_board?
      victory_reset if @snake.collide?(@food)
    else
      @die_sound.play
      @dead = true
      @score = 0
      need_food_badly
      gimme_new_snake
      @snake.speed = 5
    end
  end

  def draw
    @snake.draw
    @food.draw
    @score_draw.draw_text("Score: #{@score}", 25, 25, 1, 1.0, 1.0, Gosu::Color::RED)
    if @dead
      @font.draw_text("SNAKE DIE!", 100, 120, 1, 1.0, 1.0, Gosu::Color::WHITE)
    end
  end

  def victory_reset
    @dead = false
    need_food_badly
    @snake.speed += 0.4
    @score += 1
    @eat_sound.play
  end

  def snake_on_board?
    @snake.x >= 0 && @snake.x <= 799 &&
      @snake.y >= 0 && @snake.y <= 599
  end

  def need_food_badly
    @food = Food.new
  end

  def gimme_new_snake
    @snake = Snake.new
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

Game.new.show
