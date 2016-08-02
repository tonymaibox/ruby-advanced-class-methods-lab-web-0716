require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name)
  	@name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
   	song = Song.new(song)
   	song.save
   	song
  end

  def self.new_by_name(name)
  	song = Song.new(name)
  end

  def self.create_by_name(name)
  	song = Song.new(name)
  	song.save
  	song
  end

  def self.find_by_name(name)
  	self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name) == true
  		nil
  	else
  		self.create_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
  	name = filename.split(" - ")[1].chomp(".mp3")
  	song = Song.new(name)
  	song.artist_name=(filename.split(" - ")[0])
  	song
  end

  def self.create_from_filename(filename)
  	song = Song.new_from_filename(filename)
  	song.save
  	song
  end

  def self.destroy_all
  	all.clear
  end
end

# Song.new_from_filename("Thunder - blach blah")