class Entity

	def initialize
	end
	
	def intersects?(e2)
	 	return (@x <= (e2.x + e2.width) &&
				e2.x <= (@x + @width) &&
				@y <= (e2.y + e2.height) &&
				e2.y <= (@y + @height)
		)
	end
end