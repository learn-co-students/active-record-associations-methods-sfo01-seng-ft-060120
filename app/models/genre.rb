class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    songs.count { |song| song.genre_id == self.id }
  end

  def artist_count
    song_array = songs.find_all { |song| song.genre_id == self.id }
    artist_array = song_array.map { |song| song.artist }.count
  end

  def all_artist_names
    artist_names = artists.map { |artist| artist.name }
  end
end
