require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :hangar, :capacity
  attr_writer :capacity

  DEFAULT_CAPACITY = 10

  def initialize(weather = Weather.new)
    @hangar = []
    @weather = weather
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    weather_check
    capacity_checks
    landing_checks(plane)
    @hangar.push(plane)
    plane.update_status
  end

  def take_off(plane)
    weather_check
    capacity_checks
    take_off_checks(plane)
    @hangar.delete(plane)
    plane.update_status
  end

  private

  def landing_checks(plane)
    raise 'Plane already landed' if at_airport?(plane)
  end

  def weather_check
    raise 'Plane cannot land or take off in stormy weather' if @weather.stormy?
  end

  def take_off_checks(plane)
    raise 'Plane has taken off from another airport' if plane.flying
    raise 'Plane has already taken off' unless at_airport?(plane)
  end

  def capacity_checks
    raise 'Plane cannot land: capacity reached' if airport_full?
  end

  def airport_full?
    @hangar.length > @capacity
  end

  def at_airport?(plane)
    @hangar.include?(plane)
  end
end
