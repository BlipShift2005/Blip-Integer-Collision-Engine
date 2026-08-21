extends Node2D

@export var collision:BlipAABB
@export var player_controlled:bool = false

func _ready()->void:
	GameState.system_physics.awake_bodies.append(collision)
	GameState.tick.connect(_tick)

func _exit_tree()->void:
	GameState.system_physics.awake_bodies.erase(collision)

func _tick()->void:
	if(player_controlled):
		var direction:Vector2 = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		position += direction * 2.0
	collision.position = Vector2i(position.floor())
	queue_redraw()

func _draw()->void:
	if(is_instance_valid(collision)): collision.draw(self)
