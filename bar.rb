class Bar

  attr_accessor :till, :bar_guests, :drinks

  def initialize()
    @till = 0
    @bar_guests = []
    @drinks = [
      {type: "wine", price: 4},
      {type: "beer", price: 3},
      {type: "soft_drink", price: 1}
    ]
  end

  def add_drinks(drinks)
    @drinks.concat(drinks)
  end

  def find_drink(drink_to_be_found)
    @drinks.find {|d| d[:type] == drink_to_be_found}
  end

  def find_price(drink_to_be_found)
    drink_found = @drinks.find {|d| d[:type] == drink_to_be_found}
    return drink_found[:price]
  end

  def add_guests(guests_to_add)
    @bar_guests.concat(guests_to_add)
  end

  def find_guest_tab(guest)
    guest_found = @bar_guests.find {|g| g == guest}
    return guest_found.bar_tab
  end

  def add_to_tab(guest, drink_to_buy)
    drink_found = @drinks.find {|d| d[:type] == drink_to_buy}
    guest_found = @bar_guests.find {|g| g == guest}
    if guest_found.wallet >= guest_found.bar_tab + drink_found[:price]
      guest_found.bar_tab += drink_found[:price]
    else
      return "Sorry, you can't afford another drink today."
    end
  end

  def settle_tab(guest_to_pay)
    guest_found = @bar_guests.find {|g| g == guest_to_pay}
    @till += guest_found.bar_tab
    guest_found.wallet -= guest_found.bar_tab
  end


end
