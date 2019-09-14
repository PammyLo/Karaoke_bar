require('minitest/autorun')
require('minitest/rg')

require_relative('../bar')
require_relative('../guest')

class BarTest < MiniTest::Test

  def setup()
    @bar = Bar.new

    @guest_1 = Guest.new("Ally", 26, 50)
    @guest_2 = Guest.new("Suzy", 22, 40)
    @guest_3 = Guest.new("Jo", 18, 62)

    @drinks = [
      {type: "wine", price: 4},
      {type: "beer": price: 3},
      {type: "spirit", price: 3},
      {type: "mixer": price: 1},
      {type: "soft_drink": price: 1}
    ]

  end

  def test_adds_to_bar_tab
    assert_equal(7, @bar.add_to_tab())
  end

  def test_can_afford

  end


end
