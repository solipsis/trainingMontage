class Card
	def initialize(train)
		@train = train
	end

	def action

	end
end

class UpCard < Card

	def action
		train.moveUp()
	end
end

class DownCard < Card

	def action
		train.moveDown()
	end
end

class RightCard < Card

	def action
		train.moveRight()
	end
end

class LeftCard < Card

	def action
		train.moveLeft()
	end
end