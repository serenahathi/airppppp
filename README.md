# Airport Challenge Revisited

[Specification](#spec) | [Quick Start](#quickstart) | [Tests](#tests) | [User Stories](#stories) | [Sample Output](#sample-output)

## Specification
<a id="spec"></a>
Revisiting Makers Academy's first weekend challenge:
```
We have a request from a client to write software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.
```

## Quick Start
<a id="quickstart"></a>
- Clone the repository
- Navigate to the project directory and run ```bundle install``` to install dependencies
- Run ```irb``` and then ```require: ./lib/airport```

## User Stories
<a id="stories"></a>

```
As an air traffic controller
So I can get passengers to a destination
I want to instruct a plane to land at an airport
```

```
As an air traffic controller
So I can get passengers on the way to their destination
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
```

```
As an air traffic controller
To ensure safety
I want to prevent takeoff when weather is stormy
```

```
As an air traffic controller
To ensure safety
I want to prevent landing when weather is stormy
```

```
As an air traffic controller
To ensure safety
I want to prevent landing when the airport is full
```

```
As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
```

## Tests
<a id="tests"></a>
- Tests are run using RSpec
- Run ```rspec``` in the root of the project directory
- Test summary:

![1e0cd667-2166-4a9c-8832-5ef0bb2395ab-387-000003eca1f66eee](https://user-images.githubusercontent.com/29439776/44202568-a9040700-a14c-11e8-9371-70c9e85859ae.jpg)

## Sample Output
<a id="sample-output"></a>

```
2.5.0 :001 > airport = Airport.new
 => #<Airport:0x00007ff16a92b478 @hangar=[], @weather=#<Weather:0x00007ff16a92b450>, @capacity=10>

2.5.0 :002 > plane = Plane.new
 => #<Plane:0x00007ff16a9171d0 @flying=true>

2.5.0 :003 > airport.land(plane)
 => false

 2.5.0 :004 > airport.land(plane)
RuntimeError (Plane already landed)

2.5.0 :005 > airport.hangar
 => [#<Plane:0x00007ff16a9171d0 @flying=false>]

2.5.0 :006 > airport.take_off(plane)
Traceback (most recent call last):
RuntimeError (Plane cannot land or take off in stormy weather)

2.5.0 :007 > airport.take_off(plane)
 => true

2.5.0 :008 > airport
 => #<Airport:0x00007ff16a92b478 @hangar=[],
 @weather=#<Weather:0x00007ff16a92b450>, @capacity=10>
2.5.0 :009 >
```

