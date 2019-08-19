require "pry"
class Song
  
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = Song.new
    song.save 
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create 
    song.name = song_name
    song 
  end

  def self.find_by_name(song_name)
    self.all.find{ |song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    Song.all.sort_by{ |song_instance| song_instance.name}
  end

  def self.new_from_filename(file_name)
    sorted_file = file_name.delete_suffix(".mp3")
    ham = sorted_file.split(" - ")
    song = self.new
    song.artist_name = ham[0]
    song.name = ham[1] 
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  #binding.pry

end
