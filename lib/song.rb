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
    song.save
    song
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end 
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.find_by_name(target_name)
    @@all.find { |song| song.name == target_name}
  end
  
  def self.find_or_create_by_name(song_name)
    found_song = self.find_by_name(song_name)
    if !found_song
      found_song = create_by_name(song_name)
    end 
    found_song
  end
  
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end 
  
  def self.new_from_filename(file_name)
    splited_name = file_name.split(" - ")
    artist_name = splited_name[0]
    song_name = splited_name[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(file_name)
    splited_name = file_name.split(" - ")
    artist_name = splited_name[0]
    song_name = splited_name[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
  
end 