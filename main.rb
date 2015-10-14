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
		#@train1 = Train.new(@trainImg, @grid)

		@deck = Deck.new()
		@testPlayer = Player.new(@deck, @grid, self)

		puts "player made"

		@testPlayer.hand.each do |card|
			puts card.to_s
		end
	end

	def update
		@fpscounter.update
		@testPlayer.train.update
	end

	def draw
		@fpscounter.draw
		@grid.draw
		@testPlayer.train.draw
	end

end

GameWindow.new.show()

you can do it. Try to get 2 chunks done each hour

# todo
# implement train direction and relative left/right @10am
# implement people run around tile. explode when collide with train. add to score @11am
# implement cards for a player. highlight aronud selected card @noon
# implement swap card with 2 rounds of swapping before trains move @1pm
# implement reorder cards in hand @2pm
# implement place train on outer rim @3pm
# implement implement 2 players with train collision @4pm
# implement graphics for smoke/blood/crash
# extra : 4 players
# extra : trap tile
