

# belongs to example

class Animal
	attr_accessor :species, :zoo

	def initialize(species, zoo)
		#need the zoo argument to make the Aminal belong to the zoo
		@species = species
		@zoo = zoo
	end

	def self.create(species)
		#this does two steps: 1. Make a new thing, 2. save it 
		self.new(species).save
	end

	def save
		self.class.all << self
		self
	end

	def self.all
		@@all
	end

end


# has many example

class Zoo

	@@all = []

	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def self.create(name)
		self.new(name).save
	end

	def save
		self.class.all << self
		self
	end

	def self.all
		@@all
	end

	def aminals
		# @@all.each do |animal|
		Aminal.all.select {|animal| animal.zoo == self}
		# calling on the Animal class goes through every instance in the Animal class
		# then it checks to see if each "zoo" attribute for teh animal matches the currect instance (which is self)
		# .select returns all instances that are true, and puts them in a new array
		# .select differs from .map as .map returs the same sized array as the original
	end


#doctors and patients have a different relationship
#they can both have multiple sources of truth
#need a third class to bring them together - appointment

#has_many_through example

Appintment.new(doctor, patient)

Doctor has_many Appointments 
Appt belongs to Doctor

Doctor has many Patients through Appointments

Patient has many Apptointments 
Appt belongs to Patient

#build out instagram example
#three classes Like, Picture, User
#want to be able to spit out if users have 
#1. instance method of a picture called picture.likers
#this should return a collection of user objects who have liked this picture
#2. instance method a of user user.liked_pictures
#this should return a  collection of picture objects that this user has liked

class Like

	@@all = []

	attr_accessor :title, :name

	def initialize(name, title)
		@name = name
		@title = title
		@@all << @name
		@@all << @title
	end


	def self.all
		@@all
	end

end

class Picture

	@@all = []

	attr_accessor :photo, :name

	def initialize(title)
		@title = title
		@@all << @title
	end

	def self.all
		@@all
	end

	def likers
		Like.all.select {|like| like.title == self}
		#want to look through all of the likes, and see if the current title is tied to a user name
		#return all user names associated with the current picture title
		#will have to make an array of just the correct titles first, and then iterate through and find the likers for that title
		#first time through would be select to only select the titles that are correct
		#second time through would be map, because we want the same number as the original array
	end


end

class User

	@@all = []

	attr_accessor :name

	def initialize(name)
		@name = name
		@@all << @name
	end

	def self.all
		@@all
	end

end




