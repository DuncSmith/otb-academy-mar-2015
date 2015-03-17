Feature: Hear a shout

  Rules:
    - Listener must be within 1000m
    - Shouts must be 140 characters or less

  Questions
    - Should a shouter hear their own message?
    - Should invalid shouts send error message to user?

  Background:
    Given the following geolocations:
      | Place                | Latitude   | Longitude  |
      | Manchester Picadilly | 53.4773800 | -2.2309100 |
      | On the Beach         | 53.3934580 | -2.1860940 |
      | Morrisons Cheadle    | 53.4004700 | -2.1916600 |

  Scenario: James doesn't hear Chris' shout
    Given James is at "Manchester Picadilly"
    And Chris is at "On the Beach"
    When Chris shouts "Donuts in the breakout area"
    Then James doesn't hear Chris' shout

  Scenario: James hears Chris' shout
    Given James is at "Morrisons Cheadle"
    And Chris is at "On the Beach"
    When Chris shouts "Donuts in the breakout area"
    Then James hears Chris' shout

  Scenario: Chris' shout is too long
    Given James is at "Morrisons Cheadle"
    And Chris is at "On the Beach"
    When Chris shouts
      """
      This shout will be reaaly long and long winded. it will go on for
      sometime. Much like a broken record. Chris will moan and moan and
      moan. Wibble wibbly wobb.
      This shout will be reaaly long and long winded. it will go on for
      sometime. Much like a broken record. Chris will moan and moan and
      moan. Wibble wibbly wobb.
      """
    Then James doesn't hear Chris' shout
