require('pry')

class Guest

attr_accessor :name, :age, :wallet, :fav_song

  def initialize(name, age, wallet, fav_song="")
    @name = name
    @age = age
    @wallet = wallet
    @fav_song = fav_song
  end

  def pay(amount)
    if @wallet >= amount
      total = @wallet - amount
      return total
    else
      return "Sorry, not enough cash to get in.."
    end
  end



end
