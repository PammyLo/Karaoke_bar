require('minitest/autorun')
require('minitest/rg')
require('pry')

require_relative('../bar')
require_relative('../guest')

class BarTest < MiniTest::Test

  def setup()
    @bar = Bar.new

    @guest_1 = Guest.new("Ally", 26, 50)
    @guest_2 = Guest.new("Suzy", 22, 40)
    @guest_3 = Guest.new("Jo", 18, 62)

    @bar_guests = [@guest_1, @guest_2, @guest_3]


    @drinks = [
      {type: "spirit", price: 3},
      {type: "mixer", price: 1},
    ]

  end

  def test_add_drinks
    assert_equal([
      {type: "wine", price: 4}, {type: "beer", price: 3},
      {type: "soft_drink", price: 1}, {type: "spirit", price: 3},
      {type: "mixer", price: 1}], @bar.add_drinks(@drinks))
  end

  def test_find_drink
    assert_equal({type: "wine", price: 4}, @bar.find_drink("wine"))
  end

  def test_find_price
    assert_equal(4, @bar.find_price("wine"))
  end

  def test_add_guests
    assert_equal(3, @bar.add_guests(@bar_guests).count)
  end

  def test_find_guest_tab
    @bar.add_guests(@bar_guests)
    assert_equal(0, @bar.find_guest_tab(@guest_1))
  end

  def test_add_to_bar_tab
    @bar.add_guests(@bar_guests)
    assert_equal(4, @bar.add_to_tab(@guest_1, "wine"))
  end

  def test_guest_settle_tab__wallet_reduced
    @bar.add_guests(@bar_guests)
    @bar.add_to_tab(@guest_1, "wine")
    assert_equal(46, @bar.settle_tab(@guest_1))
  end

  def test_guest_settle_tab__till_increased
    @bar.add_guests(@bar_guests)
    @bar.add_to_tab(@guest_1, "wine")
    @bar.settle_tab(@guest_1)
    assert_equal(4, @bar.till)
  end

end
