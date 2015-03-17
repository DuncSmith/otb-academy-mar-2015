def distance_between(point1, point2)
  point1 = point1.split(",")
  point2 = point2.split(",")

  lat1 = point1.first.to_f
  lon1 = point1.last.to_f

  lat2 = point2.first.to_f
  lon2 = point2.last.to_f

  r = 6371
  dLat = deg2rad(lat2-lat1)
  dLon = deg2rad(lon2-lon1)

  a = Math.sin(dLat/2) * Math.sin(dLat/2) +
      Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
      Math.sin(dLon/2) * Math.sin(dLon/2)

  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
  d = r * c
  return d.round(2)
end

def deg2rad(deg)
  deg * (Math::PI/180)
end

RSpec.describe "Haversine formula" do
  it "should calculate the distance between 2 points" do
    point1 = "53.4773800,-2.2309100" #Manchester Picadilly
    point2 = "53.3934580,-2.1860940" #On the beach
    expect( distance_between(point1, point2) ).to eq(9.79)
  end

end
