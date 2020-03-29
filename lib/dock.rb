class Dock

  attr_reader :name, :max_rental_time, :rented_boats
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rented_boats = []
    @total_revenue = 0
  end

  def rent(boat, renter)
    @rented_boats << [boat, renter]
  end

  def rental_log
    categorized_rentals = {}
    @rented_boats.each do |rental|
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

  def charge(boat)
    Hash[card_number: rental_log[boat].credit_card_number,
         amount: total_charge(boat)]
  end

  def log_hour
    rental_log.each do |key, value|
      key.add_hour
    end
  end

  def return(boat_parameter)
    #This method removes boat from rental_log
    @rented_boats.each do |boat|
      @rented_boats.delete_at(0) if boat[0] == boat_parameter
    end
    @rented_boats
  end

  def revenue
    #Revenue only caluclates when all boats are returned
    #It is a running total of all revenue collected
    @total_revenue
  end
end
