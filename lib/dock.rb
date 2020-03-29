class Dock

  attr_reader :name, :max_rental_time
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = []
  end

  def rent(boat, renter)
    @rental_log << [boat, renter]
  end

  def rental_log
    categorized_rentals = {}
    @rental_log.each do |rental|
      categorized_rentals[rental[0]] = rental[1]
    end
    categorized_rentals
  end

  def total_charge(boat)
    if boat.hours_rented > max_rental_time
       max_rental_time * boat.price_per_hour
    else
      boat.hours_rented * boat.price_per_hour
    end
  end
end
