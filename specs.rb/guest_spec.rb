require("Minitest/autorun")
require("Minitest/rg")
require_relative("../guest")
require_relative("../room")
# require_relative('../bar')

class GuestTest < MiniTest::Test

  def setup()
    @guest_1 = Guest.new("Ian", 34, 50, "Never Gonna Give You Up")
    @room = Room.new(50)

  end

  def test_can_pay
    assert_equal(35, @guest_1.pay(@room.entry_fee))
  end

  def test_pay_bar_tab
    assert_equal(50, @guest_1.pay_tab)
  end

end
