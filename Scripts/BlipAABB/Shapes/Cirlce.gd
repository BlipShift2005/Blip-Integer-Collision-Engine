@tool
class_name BlipAABBCircle extends BlipAABB

@export var radius:int

func intersects(position_a:Vector2i,position_b:Vector2i,with:BlipAABB)->bool:
	var radius_squared:int
	# Circle on Circle
	if(with is BlipAABBCircle):
		radius_squared = (with.radius+radius)*(with.radius+radius)
		var dist:Vector2i = (position_b - position_a)
		var distance_squared:int = (dist.x*dist.x)+(dist.y*dist.y)
		return (distance_squared < radius_squared)
	# Circle on Rectangle
	radius_squared = (radius*radius)
	var difference:Vector2i = position_a - position_b
	var clamped:Vector2i = difference.clamp(-with.size,with.size)
	difference = (position_b+clamped)-position_a
	return (radius_squared > difference.length_squared())

func draw(canvas:CanvasItem,offset:Vector2 = Vector2.ZERO,shift_by:int = 0)->void:
	var true_size:float = float(radius>>shift_by)
	var true_position:Vector2 = offset
	canvas.draw_circle(true_position,true_size,Color(0.824, 0.0, 0.28, 0.702) if(_collided_this_tick)else Color(0.357, 0.294, 1.0, 0.702))
