require('minitest/autorun')
require('minitest/rg')
require_relative("../song")

class SongTest < MiniTest::Test
  #
  # def initialize(name, artist)
  #   @title = title
  #   @artist = artist
  #   @lyrics = lyrics
  # end
  #
  def setup()
    @song_1 = Song.new("Black", "Enya")
  end


end
