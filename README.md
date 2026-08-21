# Blip Integer Collision System for Godot 4
SMBX2 made me crash out and write this lol

## What will this feature?
2D collision only for the time being, if someone starts writing a 3D version then ill give the green light to add it to the repo, 
but currently 2D collision is already a lot for me. This is more prototyping for an eventual C/C++ collision/physics engine.

Fraction bits are not something forced by this one, since you don't always need the fraction. Instead will be made optional. If ported to be an addon I may make it something you can change in the project settings but for now each function you can pass in fraction bits.

- Collision Shapes
	- Rectangle
	- Circle
- Collision Polygons (unimplimented)
- FixedCharacterBody2D (unimplimented)
- FixedStaticBody2D + FixedAnimatableBody2D
- A template tick system for use in your own project.
- Maybe a version of the animation player that uses ticks instead of float.
- Same thing with tweens, timers, ect.

I don't plan on much else, this is currently an AABB system since I can't find any tutorial that has comprehensible code.

## The plan
Not only determanistic physics, but also something that can make replays easier, making sure they work the same on every system.
