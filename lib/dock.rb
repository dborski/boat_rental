class Dock

  attr_reader :name, :max_rental_time, :rental_log
  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @total_revenue = 0
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat_to_be_charged)
    boat_we_need = @rental_log.find { |rental| rental[0] = boat_to_be_charged}
    if boat_we_need[0].hours_rented > max_rental_time
      {card_number: boat_we_need[1].credit_card_number,
      amount: max_rental_time * boat_we_need[0].price_per_hour}
    else
      {card_number: boat_we_need[1].credit_card_number,
      amount: boat_we_need[0].hours_rented * boat_we_need[0].price_per_hour}
    end
  end

  def log_hour
    rental_log.each do |rental|
      rental[0].add_hour
    end
  end

  def return(boat_to_be_returned)
    sum = charge(boat_to_be_returned)[:amount]
    @rental_log.delete(boat_to_be_returned)
    @total_revenue += sum
  end

  def revenue
    @total_revenue
  end
end
