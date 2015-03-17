require 'shouty'

RSpec.describe "Haversine formula" do
  it "should calculate the distance between 2 points" do
    picadilly = Location.new("53.4773800,-2.2309100".split(","))
    onthebeach = Location.new("53.3934580,-2.1860940".split(","))

    expect( picadilly.distance_to(onthebeach) ).to eq(9.79)
  end

  it "should calculate the distance between 2 points 2" do
    morrisons = Location.new("53.4004700,-2.1916600".split(","))
    onthebeach = Location.new("53.3934580,-2.1860940".split(","))

    expect( morrisons.distance_to(onthebeach) ).to eq(0.86)
  end
end
