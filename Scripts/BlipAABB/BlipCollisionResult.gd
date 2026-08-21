class_name BlipCollisionResult extends Resource

## The collider object.
var collider:Node2D
## Shape that was hit.
var collider_shape:BlipAABB
## The position at which the collision happened.
var position:Vector2i
## The normal of the collision
var normal:Vector2i
## The normal where the collider shape was hit. I've always wanted this and godot won't give it to me.
var shape_normal:Vector2i
## The depth of the penitration, squared.
var depth_squared:int
## When grabbed, live sqrt's the depth. Don't grab it too much :P
var depth:int:
	set(value):
		depth_squared = value*value
	get(): # NOTE: probably change later lol. sqrt returns a float, which could technically mean something could desync.
		return floori(sqrt(depth_squared))
## The motion that was used for this interaction.
var motion:Vector2i
## How far the shape got before colliding.
var travel:Vector2i
