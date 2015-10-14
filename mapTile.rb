class MapTile

	attr_accessor :people, :x, :y, :width, :height

	def initialize(x, y, width, height, img)
		@x = x + width/2
		@y = y + height/2
		@width = width
		@height = height
		@img = img

		@x_scale = @width.to_f / @img.width.to_f
		@y_scale = @height.to_f / @img.width.to_f

		@people = Array.new()

		addPeople
	end

	def update
		@people.each do |person|
			person.update
		end
	end

	def draw
		#@img.draw(@x, @y, 1, 1, 1, @color, mode = :additive)
		@img.draw_rot(@x, @y, 1, 0, 0.5, 0.5, @x_scale, @y_scale)

		@people.each do |person|
			person.draw
		end
	end

	def addPeople
		100.times do |x|
			@people.push(Person.new(self, @img))
		end
	end


end