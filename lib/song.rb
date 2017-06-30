class Song

	attr_accessor :name, :artist

	def initialize(name)
		@name = name
	end

	def artist_name
		@artist = self.artist
		if @artist.nil?
			nil
		else
			@artist.name
		end
	end

	def name
		@name
	end

end