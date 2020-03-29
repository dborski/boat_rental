require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require './lib/renter'

class BoatTest < Minitest::Test

  def setup
    @kayak = Boat.new(:kayak, 20)
  end

  def test_it_exists

    assert_instance_of Boat, @kayak
  end

  def test_it_has_attributes

    assert_equal :kayak, @kayak.type
    assert_equal 20, @kayak.price_per_hour
  end

  def test_hours_rented

    assert_equal 0, @kayak.hours_rented

    @kayak.add_hour
    @kayak.add_hour
    @kayak.add_hour

    assert_equal 3, @kayak.hours_rented
  end
end




# ## Iteration 1
#
# Use TDD to create a `Boat` and a `Renter` class that respond to the following interaction pattern:



# renter = Renter.new("Patrick Star", "4242424242424242")
# # => #<Renter:0x00007fb5ef98b118...>
#
# renter.name
# # => "Patrick Star"
#
# renter.credit_card_number
# # => "4242424242424242"
