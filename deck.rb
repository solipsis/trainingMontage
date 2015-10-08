class Deck

	attr_accessor :cards

	STRAIGHT_1 = 15
	STRAIGHT_2 = 10
	STRAIGHT_3 = 5
	RIGHT = 10
	LEFT = 10


	def initialize()
		@cards = Array.new()

		# todo fix
		straight1_img = nil
		STRAIGHT_1.times do
			puts "adding card"
			cards.push(Card.new(:straight1, straight1_img))
		end

		# STRAIGHT_2.times do
		# 	cards.push(Card.new(:straight2, straight2_img))
		# end

		# RIGHT.times do
		# 	cards.push(Card.new(:right, right_img))
		# end

		puts "deck initialized"

		@cards.shuffle!
	end

	def dealCard()
		return @cards.pop
	end

end
