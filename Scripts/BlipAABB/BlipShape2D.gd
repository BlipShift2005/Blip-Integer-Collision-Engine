@tool
class_name BlipShape2D extends Node2D

## The true position of the shape. Modify this in game
@export var fixed_position:Vector2i:
	set(value):
		fixed_position = value
		queue_redraw()
@export var shape:BlipAABB:
	set(value):
		shape = value
		queue_redraw()

func _ready()->void:
	if(Engine.is_editor_hint()): return
	GameState.tick.connect(_tick)

func _validate_property(property:Dictionary)->void:
	if(property.name == "fixed_position"):
		property.usage |= PROPERTY_USAGE_READ_ONLY

func _physics_process(_delta:float)->void:
	if(Engine.is_editor_hint()):
		fixed_position = Vector2i(position.floor())

func _tick()->void: queue_redraw()

func _draw()->void:
	if(not is_instance_valid(shape)): return
	shape.draw(self,-position + Vector2(fixed_position))
