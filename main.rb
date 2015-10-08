# real training montage begins here

require 'gosu'
require 'chipmunk'
require_relative 'fpscounter'
require_relative 'card'
require_relative 'train'
require_relative 'grid'
require_relative 'mapTile'
require_relative 'deck'
require_relative 'player'

class GameWindow < Gosu::Window

	def initialize
		super 1280, 800, false
		self.caption = "Training Montage"
		@fpscounter = FPSCounter.new(self)
		@tile_size = 100
		@tileImg = Gosu::Image.new(self, "square.png", false)
		@trainImg = Gosu::Image.new(self, "circle_icon.png", false)


		@grid = Grid.new(10, 10, @tileImg)
		@train1 = Train.new(@trainImg, @grid)

		@deck = Deck.new()
		testPlayer = Player.new(@deck)

		puts "player made"
		puts testPlayer.hand
	end

	def update
		@fpscounter.update
		@train1.update
	end

	def draw
		@fpscounter.draw
		@grid.draw
		@train1.draw
	end

end

GameWindow.new.show()