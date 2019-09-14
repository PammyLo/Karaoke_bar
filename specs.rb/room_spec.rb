require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../song")
require_relative("../guest")

class RoomTest < MiniTest::Test

  def setup()

    @room = Room.new(5)

    @guest_1 = Guest.new("Mark", 21, 50, "Never Gonna Give You Up")
    @guest_2 = Guest.new("John", 23, 50)
    @guest_3 = Guest.new("Sue", 19, 50)
    @guest_4 = Guest.new("Hector", 32, 50)
    @guest_5 = Guest.new("Blair", 18, 50)
    @guest_6 = Guest.new("Melinda", 20, 50)

    @song_1 = Song.new("Moon", "Enya")
    @song_2 = Song.new("Blue Suede Shoes", "Elvis")
    @song_3 = Song.new("Never Gonna Give You Up", "Rick Astley")


  end

  def test_can_check_in_guest
    assert_equal(1, @room.check_in(@guest_1).count)
  end

  def test_can_check_out_guest
    @room.check_in(@guest_2)
    @room.check_in(@guest_1)
    assert_equal(1, @room.check_out(@guest_1).count)
  end

  def test_room_full__no
    assert_equal(false, @room.room_full)
  end

  def test_room_full__yes
    @room.check_in(@guest_2)
    @room.check_in(@guest_1)
    @room.check_in(@guest_4)
    @room.check_in(@guest_5)
    @room.check_in(@guest_3)
    assert_equal(true, @room.room_full)
  end

  def test_allow_guest_in_only_if_not_full
    assert_equal("Sorry, room is full", @room.allow_in(@guest_6))
  end

  def test_add_song
    assert_equal(1, @room.add_song(@song_1).count)
  end

  def test_remove_song
    @room.add_song(@song_1)
    @room.add_song(@song_2)
    @room.add_song(@song_3)
    assert_equal(2, @room.remove_song(@song_1).count)
  end

  def test_fav_song_on_list
    @room.add_song(@song_3)
    assert_equal(true, @room.fav_song_on_list?("Never Gonna Give You Up"))
  end

  def test_fav_song_on_list
    @room.add_song(@song_3)
    assert_equal("Whoohoo! I love Never Gonna Give You Up!", @room.fav_song_jay?(@guest_1.fav_song))
  end

end
