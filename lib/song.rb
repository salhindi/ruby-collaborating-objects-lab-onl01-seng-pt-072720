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
    song_name = filename.split(" - ")
    artist = Artist.find_or_create_by_name(song_name[0])
    song = self.new(song_name[1])
    song.artist = artist
    artist.add_song(song)
    song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end
end
