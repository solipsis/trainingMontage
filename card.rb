class Card
	
	attr_accessor :action

	def initialize(action, img)
		@action = action
		@img = img
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

	def act
		train.moveRight()
	end
end

class LeftCard < Card

	def action
		train.moveLeft()
	end
end