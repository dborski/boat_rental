require 'minitest/autorun'
require 'minitest/pride'
require './lib/boat'
require './lib/renter'
require './lib/dock'

class DockTest < Minitest::Test

  def setup
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20)
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
    @dock.rent(@kayak_1, @patrick)
    @dock.rent(@kayak_2, @patrick)
    @dock.rent(@sup_1, @eugene)
  end

  def test_it_exists

    assert_instance_of Dock, @dock
  end

  def test_it_has_attributes

    assert_equal "The Rowing Dock", @dock.name
    assert_equal 3, @dock.max_rental_time
  end

  def test_rental_log

    assert_equal ({
       @kayak_1 => @patrick,
       @kayak_2 => @patrick,
       @sup_1 => @eugene}), @dock.rental_log
  end

  def test_total_charge
    @kayak_1.add_hour
    @kayak_1.add_hour

    assert_equal 40, @dock.total_charge(@kayak_1)

    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour

    assert_equal 45, @dock.total_charge(@sup_1)
  end

  def test_charge_renter_for_boat
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @sup_1.add_hour
    @dock.charge(@sup_1)

    assert_equal (  {
        :card_number => "1313131313131313",
        :amount => 45}), @dock.charge(@sup_1)
  end
end
