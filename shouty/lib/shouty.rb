class Person
  attr_writer :location
  attr_reader :heard_messages

  def initialize(network)
    @network = network
    @network.subscribe(self)
    @heard_messages = []
  end

  def shout(message)
    @network.broadcast(message, @location)
  end

  def hear(message)
    @heard_messages << message
  end

  def within_range?(other_location)
    @location.distance_to(other_location) < 1
  end
end

class Network
  def initialize
    @people = []
  end

  def subscribe(person)
    @people << person
  end

  def broadcast(message, location)
    @people.each do |person|
      person.hear(message) if person.within_range?(location)
    end
  end
end

class Location
  attr_reader :lat, :lon
  def initialize(location)
    @lat = location.first.to_f
    @lon = location.last.to_f
  end

  def distance_to(another_location)
    @lat2 = another_location.lat
    @lon2 = another_location.lon

    distance = earth_radius * haversine_formula

    return distance.round(2)
  end

  private

  def deg2rad(deg)
    deg * (Math::PI/180)
  end

  def earth_radius
    6371
  end

  def delta_lat
    deg2rad(@lat2-@lat)
  end

  def delta_lon
    deg2rad(@lon2-@lon)
  end

  def haversine_formula
    a = Math.sin(delta_lat/2) * Math.sin(delta_lat/2) +
        Math.cos(deg2rad(@lat)) * Math.cos(deg2rad(@lat2)) *
        Math.sin(delta_lon/2) * Math.sin(delta_lon/2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    return c
  end


end
