require 'pry'

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
    song = self.new
    @@all << song
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
    @@all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song_find = self.find_by_name(song_name)

    if song_find
      song_find
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort { |a, b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    song = self.create
    array_filename = filename.split(/[-.]/)
    song.artist_name = array_filename[0].chomp(" ")
    song.name = array_filename[1].slice(1..-1)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
  
  def self.destroy_all
    @@all = Array.new
  end
end

