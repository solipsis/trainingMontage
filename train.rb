class Train

	def initialize(img, grid)
		@x = 300
		@y = 300
		@width = 50
		@height = 50
		@img = img

		@grid = grid
		#puts @grid.tile
		@currentTile = @grid.tiles[1][1]

		@x_scale = @width.to_f / @img.width.to_f
		@y_scale = @height.to_f / @img.width.to_f

		@actionQueue = Array.new();


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
				@x -= 1
			end

			if (x_diff < -2) then
				@x += 1
			end

			if (y_diff > 2) then
				@y -= 1
			end

			if (y_diff < -2) then
				@y += 1
			end
		else
			nextAction = @actionQueue.pop
			if nextAction != nil then
				@currentTile = self.send nextAction
			end
			#puts @currentTile
		end

	end

	def addAction(action)
		@actionQueue.insert(0, action)
	end

	def createActionQueue(hand)
		hand.each do |card|
			@actionQueue.insert(0, card.action)
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

	

end