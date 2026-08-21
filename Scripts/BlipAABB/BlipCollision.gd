class_name BlipCollision extends Resource

var awake_bodies:Array[BlipAABB]


const NORMAL_PERCISION_BITS:int = 8

func _tick()->void:
	for body:BlipAABB in awake_bodies:
		body._collided_this_tick = false
		for body2:BlipAABB in awake_bodies:
			if(body == body2): continue
			body._collided_this_tick = body.intersects(body.position,body2.position,body2) or body._collided_this_tick
