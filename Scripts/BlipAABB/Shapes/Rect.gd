@tool
class_name BlipAABBRect extends BlipAABB

## Half of the rect's size.
@export var size:Vector2i

func intersects(position_a:Vector2i,position_b:Vector2i,with:BlipAABB)->bool:
	if(not (with is BlipAABBRect)):
		return with.intersects(position_a,position_b,self)
	var distance:Vector2i = (position_b - position_a).abs()
	var limit:Vector2i = (with.size + size)
	return (distance.x < limit.x and distance.y < limit.y)

func draw(canvas:CanvasItem,offset:Vector2 = Vector2.ZERO,shift_by:int = 0)->void:
	var true_size:Vector2 = Vector2(size.x>>shift_by,size.y>>shift_by)
	var rect:Rect2 = Rect2(
		-true_size,
		true_size*2.0)
	rect.position += offset
	canvas.draw_rect(rect,Color(0.824, 0.0, 0.28, 0.702) if(_collided_this_tick)else Color(0.357, 0.294, 1.0, 0.702))
