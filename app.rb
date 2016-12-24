require 'ruby2d'

require_relative 'snake'
require_relative 'food'

NUMBER_OF_FOOD = 100
ROWS = 50
COLS = 50
PIXEL_SIZE = 20
WIDTH = COLS * PIXEL_SIZE
HEIGHT = ROWS * PIXEL_SIZE

set width: WIDTH, height: HEIGHT, title: "Snake", fps: 10

snake = Snake.new
foods = []

on key: 'd' do
  snake.direct(1, 0)
end

on key: 'a' do
  snake.direct(-1, 0)
end

on key: 'w' do
  snake.direct(0, -1)
end

on key: 's' do
  snake.direct(0, 1)
end

on key: 'q' do
  snake.grow
end

update do
  while foods.size < NUMBER_OF_FOOD
    foods << Food.new
  end
  snake.update_position
  for food in foods
    snake.eat(food)
    foods.delete(food) if food.refresh.nil?
  end
end

show
