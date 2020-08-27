require 'pry'
class MP3Importer
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
 
  def files
    #loads all files from path directory "Dir"
    @files = Dir.entries(@path)
    @files.delete_if {|file| file == "." || file == ".."}
  end
  
  def import 
    self.files.each {|filename| song = Song.new_by_filename(filename)}
  end

end