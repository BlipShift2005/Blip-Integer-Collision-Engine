@abstract
class_name BlipAABB extends Resource

## The position.
@export var position:Vector2i

var _collided_this_tick:bool = false

@abstract func intersects(position_a:Vector2i,position_b:Vector2i,with:BlipAABB)->bool
@abstract func draw(canvas:CanvasItem,offset:Vector2 = Vector2.ZERO,shift_by:int = 0)->void
