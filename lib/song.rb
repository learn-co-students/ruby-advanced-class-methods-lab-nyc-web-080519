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
    s = Song.new
    s.save
    s
  end
  
  def self.new_by_name(new_name)
    s = self.new
    s.name = new_name
    s
    
  end
  
  def self.create_by_name(new_name)
    s = self.create
    s.name = new_name
    s
  end
  
  def self.find_by_name(name)
    x = self.all.select {|s| s.name == name}
    return x[0] if x.length == 1 
    return nil if x.empty?
    x
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  
  def self.create_from_filename(file)
    arr = file.split(" - ")
    artist_name = arr.first
    s_name = arr.last[0...-4]
    s = self.create
    s.name = s_name
    s.artist_name = artist_name
    s
  end


  def self.new_from_filename(file)
    arr = file.split(" - ")
    artist_name = arr.first
    s_name = arr.last[0...-4]
    s = self.new
    s.name = s_name
    s.artist_name = artist_name
    s
  end
  
  def self.destroy_all
    @@all = []
  end


end
