
require 'pry'
class Artist
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  
  def add_song(song)
    song.artist = self
  end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all 
  end

  def self.find_or_create_by_name(name)
    if theartist = self.all.find {|s| s.name == name}
      theartist
    else 
      self.new(name)
    end
  end
    
    def print_songs
      self.songs.each {|s| puts s.name}
    end
end
