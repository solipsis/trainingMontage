class Player

	attr_accessor :train, :hand, :score

	def initialize(deck, grid, gameWindow)
		@grid = grid
		@gameWindow = gameWindow
		trainImg = Gosu::Image.new(gameWindow, "circle_icon.png", false)

		@train = Train.new(trainImg, @grid)
		@hand = Array.new()
		@score = 0
		@deck = deck

		getStartingHand()
		@train.createActionQueue(@hand)
	end

	def getStartingHand
		4.times do
			@hand.push(@deck.dealCard)
		end
	end

	


end