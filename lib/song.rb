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
    song=self.new 
    @@all << song 
    song
  end 

  def self.new_by_name(name)
    song=self.new 
    song.name=name 
    song
  end

  def self.create_by_name(song)
    newsong=self.new
    newsong.name= song  
    @@all << newsong 
    newsong
  end 

  def self.find_by_name(name)
    self.all.find do |x| x.name == name end
    end 
  
    def self.find_or_create_by_name(name)
     if !self.find_by_name(name)
      self.create_by_name(name)
     else 
      self.find_by_name(name)
     end 
     end 

  def self.alphabetical 
    self.all.sort_by{|x| x.name}
  end 

  def self.new_from_filename(filename)
    # name= filename.split(" - ")[0]
    # song= filename.split(" - ")[1].chomp('.mp3')
    song=self.new 
    song.artist_name= filename.split(" - ")[0]
    song.name= filename.split(" - ")[1].chomp('.mp3')
    song
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename) 
  end

  def self.destroy_all
    self.all.clear
  end 
end
