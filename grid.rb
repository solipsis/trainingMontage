class Grid

	TILE_SIZE = 100
	attr_accessor :tiles

	def initialize(numRows, numCols, tileImg)
		#@numRows = numRows
		#@numCols = numCols

		@numRows = 4
		@numCols = 4

		@tiles = Array.new(@numRows) { Array.new(@numCols, "blah") }
		puts @tiles
		for i in 0...@numRows do
			for j in 0...@numCols do
				@tiles[i][j] = MapTile.new(i*TILE_SIZE, j*TILE_SIZE, TILE_SIZE, TILE_SIZE, tileImg)
			end
		end

	end

	def getTile(tile, direction)

		tile_x = -1
		tile_y = -1

		for i in 0...@numRows do
			for j in 0...@numCols do
				if (tile == @tiles[i][j]) then
					tile_x = i
					tile_y = j
				end
			end
		end

		




		case direction
		when :up
			if (tile_y-1 < 0) then return nil else return @tiles[tile_x][tile_y-1] end
		when :down
			if (tile_y+1 >= @numCols) then return nil else return @tiles[tile_x][tile_y+1] end
		when :right
			if (tile_x+1 >= @numRows) then return nil else return @tiles[tile_x+1][tile_y] end
		when :left
			if (tile_x-1 < 0) then return nil else return @tiles[tile_x-1][tile_y] end



	end


	end

	def draw
		for i in 0...@numRows do
			for j in 0...@numCols do
				@tiles[i][j].draw
			end
		end
	end

end