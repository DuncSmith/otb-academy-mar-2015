module ShoutyDomain
  def the_network
    @the_network ||= Network.new
  end
end
World(ShoutyDomain)


Given(/^the following geolocations:$/) do |locations|
  p locations.hashes
  # table is a Cucumber::Ast::Table
   pending # express the regexp above with the code you wish you had
end

Given(/^"(.*?)" is at "(.*?)"$/) do |location, lat_long|
  @locations ||= {}
  @locations[location] = lat_long.split(",")
end

Given(/^James is at "(.*?)"$/) do |location|
  @james = Person.new(the_network)
  @james.location = Location.new(@locations[location])
end

Given(/^Chris is at "(.*?)"$/) do |location|
  @chris = Person.new(the_network)
  @chris.location = Location.new(@locations[location])
end

When(/^Chris shouts "(.*?)"$/) do |message|
  @the_shout = message
  @chris.shout(@the_shout)
end

When(/^Chris shouts$/) do |message|
  @the_shout = message
  @chris.shout(@the_shout)
end

Then(/^James doesn't hear Chris' shout$/) do
  expect(@james.heard_messages).not_to include(@the_shout)
end

Then(/^James hears Chris' shout$/) do
  expect(@james.heard_messages).to include(@the_shout)
end


