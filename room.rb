require 'pry'

class Room

attr_accessor :capacity, :song_list, :guests, :entry_fee

  def initialize(capacity)
    @capacity = capacity
    @song_list = []
    @guests = []
    @entry_fee = 15
  end

  def check_in(wannabe_guest)
    @guests << (wannabe_guest)
  end

  def check_out(wannaleave_guest)
    @guests.delete(wannaleave_guest)
    return @guests
  end

  def room_full
    @guests.count >= @capacity
  end

  def allow_in(wannabe_guest)
    if @guests.count >= @capacity
      @guests.check_in(wannabe_guest)
    else
      return "Sorry, room is full"
    end
  end

  def add_song(song_to_add)
    @song_list << (song_to_add)
  end

  def remove_song(song_to_remove)
    @song_list.delete(song_to_remove)
    return @song_list
  end

  def fav_song_on_list?(favourite_song_by_title)
    for song in @song_list
      return true if song.title == (favourite_song_by_title)
      return false
    end
  end

  def fav_song_jay?(favourite_song_by_title)
    for song in @song_list
     if song.title == (favourite_song_by_title)
       return "Whoohoo! I love #{favourite_song_by_title}!"
      else
       return "What a crap karaoke bar, they don't even have #{favourite_song_by_title}!"
     end
    end
  end


end
