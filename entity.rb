class Entity

	def initialize
	end

	def intersects?(e2)
		#puts "w:" + @width.to_s
		#puts "h:" + @height.to_s
		#puts "x:" + @x.to_s
		#puts "y:" + @y.to_s
		# 	 	return (@x <= (e2.x + e2.width) &&
		# 		e2.x <= (@x + @width) &&
		# 		@y <= (e2.y + e2.height) &&
		# 		e2.y <= (@y + @height)
		# )
	 	return (@x-@width/2 <= (e2.x + e2.width) &&
				e2.x <= (@x + @width/2) &&
				@y-@height/2 <= (e2.y + e2.height) &&
				e2.y <= (@y + @height/2)
		)
	end
end