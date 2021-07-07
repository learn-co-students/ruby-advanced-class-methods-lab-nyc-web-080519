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
    new_song = Song.new
    new_song.save
    new_song
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
    self.all.select { |song| song.name == song_name }.first
  end

 def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    name = file.first
    song_name = file.last.split(".").first

    new_song = Song.new
    new_song.name = song_name
    new_song.artist_name = name
    new_song
  end

  def self.create_from_filename(filename)
    file = filename.split(" - ")
    name = file.first
    song = file.last.split(".").first

    new_song = self.create
    new_song.name = song
    new_song.artist_name = name
    song
  end


  def self.destroy_all
    self.all.clear
  end

end
