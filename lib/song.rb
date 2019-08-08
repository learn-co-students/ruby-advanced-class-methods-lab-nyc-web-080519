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

  def self.new_by_name(song_title)
    song = Song.new
    song.save
    song.name = song_title 
    song
  end

  def self.find_by_name (song_title)
    Song.all.find do |title|
      title.name == song_title
    end 
  end 

  def self.create_by_name(song_title) 
    song = Song.new 
    song.save 
    song.name = song_title 
    song 
  end 

  def self.find_or_create_by_name(song_title)
    self.find_by_name(song_title)|| self.create_by_name(song_title)
  end 

  def self.alphabetical
    Song.all.sort_by do |song_names|
      song_names.name
    end  
  end 


  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end 


# Song.create_by_name("Abby Road")
# Song.create_by_name("Here Comes the Sun")
# Song.create_by_name("Here Comes the Sun")

# Song.all