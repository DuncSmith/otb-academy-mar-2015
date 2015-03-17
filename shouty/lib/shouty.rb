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
    lat2 = another_location.lat
    lon2 = another_location.lon

    dLat = deg2rad(lat2-@lat)
    dLon = deg2rad(lon2-@lon)

    a = Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.cos(deg2rad(@lat)) * Math.cos(deg2rad(lat2)) *
        Math.sin(dLon/2) * Math.sin(dLon/2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    distance = earth_radius * c
    return distance.round(2)
  end

  def deg2rad(deg)
    deg * (Math::PI/180)
  end

  def earth_radius
    6371
  end


end
