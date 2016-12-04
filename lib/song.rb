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

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect do |song_instance|
      song_instance.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    song_arr = file.split(" - ")
    artist = song_arr[0]
    song_title = song_arr[1].gsub(".mp3", "")

    new_song = self.new
    new_song.name = song_title
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file)
    song_arr = file.split(" - ")
    artist = song_arr[0]
    song_title = song_arr[1]
    song_title = song_title[0..-5]
    new_song = self.create_by_name(song_title)
    new_song.artist_name = artist
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
