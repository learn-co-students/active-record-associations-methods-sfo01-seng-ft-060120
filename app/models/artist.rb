class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    self.songs.first.genre
  end

  def song_count
    count = self.songs.count
  end

  def genre_count
    genre_count = self.songs { |song| genre_count << song.genre }
    genre_count.uniq.count
  end
end
