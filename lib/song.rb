require 'pry'
class Song 
  attr_accessor :name, :artist 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @artist = artist 
    save
  end
  
  def save
    @@all << self 
  end 
  
  def self.all 
    @@all
  end
  
  def self.new_by_filename(filename)
    splitter = filename.split(" - ")
    artist = Artist.find_or_create_by_name(splitter[0])
    song = self.new(splitter[1])
    song.artist = artist
    artist.add_song(song)
    song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
end
