class Person < Entity

	attr_accessor :x, :y, :width, :height

	def initialize(mapTile, img)
		@img = img
		@tile = mapTile
		@width = 5
		@height = 5
		@max_x = @tile.x + @tile.width/2
		@max_y = @tile.y + @tile.height/2
		@min_x = @tile.x - @tile.width/2
		@min_y = @tile.y - @tile.height/2

		@x_scale = @width.to_f / @img.width.to_f
		@y_scale = @height.to_f / @img.width.to_f
		initPosition
	end

	def initPosition
		@x = rand((@tile.x - @tile.width/2)..(@tile.x + @tile.width/2))
		@y = rand((@tile.y - @tile.height/2)..(@tile.y + @tile.height/2))
	end

	def draw
		@img.draw_rot(@x, @y, 1, 0, 0.5, 0.5, @x_scale, @y_scale)
	end

	def update
	#	puts "update"

		x = @x + rand(-2..2) 
		y = @y + rand(-2..2)

		if (x > @max_x || x < @min_x) 
			x = @x
		end

		if (y > @max_y)
			y = @y
		end

		@x = x
		@y = y
	end


end