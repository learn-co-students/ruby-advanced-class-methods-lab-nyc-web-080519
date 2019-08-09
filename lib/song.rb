class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = self.new
    @@all << song
    song
  end

  def Song.create_by_name(song_name)
    song = self.new
    @@all << song
    song.name = song_name
    song
  end

  def Song.new_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
  end

  def Song.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def Song.find_or_create_by_name(song_name)
    found = Song.find_by_name(song_name)
    if found == nil
      new_song = Song.create_by_name(song_name)
      return new_song
    else
      return found
    end
  end

  def Song.alphabetical
    return Song.all.sort_by! do |song|
      song.name
    end
  end

  def Song.new_from_filename(filename)
    song = self.new
    split_filename = filename.split(" - ")
    song.name = split_filename[1].split(".")[0]
    song.artist_name = split_filename[0]
    @@all << song
    return song
  end

  def Song.create_from_filename(filename)
    song = self.new
    split_filename = filename.split(" - ")
    song.name = split_filename[1].split(".")[0]
    song.artist_name = split_filename[0]
    @@all << song
    return song
  end

  def Song.destroy_all
    @@all.clear
  end

end
