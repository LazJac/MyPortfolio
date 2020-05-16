## BOIDS System w/ Movable boundaries

### Intro:

My end goal with this project was to create a BOIDS system in Unity3D to emulate a swarm 
of moving enemies, that would also follow a given path and within given boundaries.

> Note: If some classes feel unnecessary, it is because this project is being used inside 
a much bigger Gaming project.

### What is a BOIDS system?:

A BOIDS system try to mimic the natural phenomenon of floating birds. The way they seem to 
form a group even tho they only react to what the bird in front of them are doing.

The way a BOIDS system try to mimic this behavior is by adhering a single "bird" to 3
constraints:

1. Alignment : 	Align yourself with the average alignment of all neighboring birds in 
					a small radius around you.
1. Avoidance : 	Make sure to leave a small space between you and the birds around you.
1. Cohesion :	Move toward the average position of all neighboring birds in a small 
					radius around you.
					
> I added a extra behavior to make sure the "birds" stays adhered within a certain boundary,
even if the boundary moves.

### Inspired by:

+ [SmarterEveryDay - Flocking Behavior of Birds (Boids Algorithm) - Smarter Every Day 234](https://www.youtube.com/watch?v=4LWmRuB-uNU&ab_channel=SmarterEveryDay)
+ [Board To Bits - Flocking Algorithm in Unity Tutorial](https://www.youtube.com/playlist?list=PL5KbKbJ6Gf99UlyIqzV1UpOzseyRn5H1d)
