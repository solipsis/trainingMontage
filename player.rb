class Player

	attr_accessor :train, :hand, :score

	def initialize(deck)
		# @train = Train.new()
		@hand = Array.new()
		@score = 0
		@deck = deck

		getStartingHand()
	end

	def getStartingHand
		4.times do
			@hand.push(@deck.dealCard)
		end
	end

	


end