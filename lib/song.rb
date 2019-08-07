class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def initialize(song_name = "", artist_name = "")
    @name = song_name
    @artist_name = artist_name
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = new Song
    self.all << song
    song
  end
  
  def self.new_by_name(song_name)
    song = Song.new(song_name)
  end
  
  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    song = self.all.find do |x|
      x.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if (song == nil)
      song = self.create_by_name(song_name)
    end
    song
  end

  def self.alphabetical
    self.all.sort_by do |x|
      x.name
    end
  end

  def self.new_from_filename(filename)
    content = filename.split(" - ")
    song = Song.new(content[1][0...-4], content[0]) #trim .mp3
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

end
