class Train

	def initialize(img, grid)
		@x = 300
		@y = 300
		@width = 50
		@height = 50
		@img = img

		@grid = grid
		#puts @grid.tile
		@currentTile = @grid.tiles[2][2]

		@x_scale = @width.to_f / @img.width.to_f
		@y_scale = @height.to_f / @img.width.to_f

		@actionQueue = Array.new();
		@direction = :up


		#addAction(:moveLeft)
		#addAction(:moveRight)
		#addAction(:moveUp)
		# @actionQueue.push(:moveLeft)
		# @actionQueue.push(:moveDown)

		#@currentTile = self.send(@actionQueue.pop())
		puts @currentTile


	end

	def draw
		@img.draw_rot(@x, @y, 1, 0, 0.5, 0.5, @x_scale, @y_scale)
	end

	def update
		if (@currentTile == nil)
			#moveDown()
			#crash
			return
		end

		x_diff = @x - @currentTile.x
		y_diff = @y - @currentTile.y
		
		if (x_diff.abs > 2 || y_diff.abs > 2) then

			if (x_diff > 2) then
				@x -= 0.5
			end

			if (x_diff < -2) then
				@x += 0.5
			end

			if (y_diff > 2) then
				@y -= 0.5
			end

			if (y_diff < -2) then
				@y += 0.5
			end
		else
			nextAction = @actionQueue.pop
			puts "next Action:"
			puts nextAction

			if nextAction != nil then
				@currentTile = self.send nextAction
				if (@currentTile == nil)
					puts "boom" 
				end
			end
			#puts @currentTile
		end

	end

	def addAction(action)
		@actionQueue.insert(0, action)
	end

	def createActionQueue(hand)
		hand.each do |card|
			case card.action
			when :straight1
				addAction(:moveStraight)
			when :straight2
				addAction(:moveStraight)
				addAction(:moveStraight)
			when :right
				addAction(:turnRight)
			when :left
				addAction(:turnLeft)
			end
		end
	end

	def moveUp
		return @grid.getTile(@currentTile, :up)
	end

	def moveDown
		return @grid.getTile(@currentTile, :down)
	end

	def moveLeft
		return @grid.getTile(@currentTile, :left)
	end

	def moveRight
		return @grid.getTile(@currentTile, :right)
	end

	def crash
	end

	def moveStraight
		case @direction
		when :up
			moveUp
		when :down
			moveDown
		when :right
			moveRight
		when :left
			moveLeft
		end
	end

	def straight1
		addAction(:moveStraight)
	end

	def straight2
		addAction(:moveStraight)
		addAction(:moveStraight)
	end

	def straight3
		addAction(:moveStraight)
		addAction(:moveStraight)
	end

	def turnRight
		case @direction
		when :up
			@direction = :right
		when :right
			@direction = :down
		when :down
			@direction = :left
		when :left
			@direction = :up
		end
			
		moveStraight
	end

	def turnLeft
		case @direction
		when :up
			@direction = :left
		when :right
			@direction = :up
		when :down
			@direction = :right
		when :left
			@direction = :down
		end
			
		moveStraight
	end





end