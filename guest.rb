require('pry')

class Guest

attr_accessor :name, :age, :wallet, :fav_song, :bar_tab

  def initialize(name, age, wallet, fav_song="")
    @name = name
    @age = age
    @wallet = wallet
    @fav_song = fav_song
    @bar_tab = 0

  end

  def pay(amount)
    return @wallet -= amount if @wallet >= amount
    return "Sorry, not enough cash to get in.."
  end


end
