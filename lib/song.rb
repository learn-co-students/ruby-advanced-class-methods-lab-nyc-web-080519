require 'pry'


class Song
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.all
    @@all
  end  # ends self.all method
  
  def save
    self.class.all << self
  end

  def initialize  
    @@all << self
  end  #ends initialize method
  
  def self.create
    self.new
  end  # ends self.create method

  def self.new_by_name(name_of_song)
    song1 = self.new
    song1.name = name_of_song
    song1
  end  # ends self.new_by_name method

  def self.create_by_name(name_of_song)
    song1 = self.create
    song1.name = name_of_song
    song1
  end   #ends self.new_by_name method

  def self.find_by_name(name_of_song)
    @@all.find {|song| song.name == name_of_song}
  end   # ends self.find_by_name method

  def self.find_or_create_by_name(name_of_song)
    if self.find_by_name(name_of_song)
      self.find_by_name(name_of_song)  
    else
      self.create_by_name(name_of_song)
    end  # end if: find_by_name == true  
  end   #  ends self.find_or_create_by_name method

  def self.alphabetical
    self.all.sort_by { |obj| obj.name }
  end # ends self.alphabetical method

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    name_of_song = filename.split(" - ")[1].split(".")[0]
    song1 = self.create
    song1.artist_name = artist
    song1.name = name_of_song
    song1
  end  # ends self.new_from_filename method

  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    name_of_song = filename.split(" - ")[1].split(".")[0]
    song1 = self.create
    song1.artist_name = artist
    song1.name = name_of_song
    song1
  end  # ends self.create_from_filename method

  def self.destroy_all
    @@all = []
  end  # ends self.detroy_all method

  # song1 = Song.new
  # song2 = Song.create
  # binding.pry

end
