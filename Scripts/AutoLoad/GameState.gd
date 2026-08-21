extends Node

static var accumulator:float = 0.0
static var framerate:int = 60

@onready var system_physics:BlipCollision = BlipCollision.new()

signal tick()

func _process(delta:float)->void:
	accumulator += delta * float(framerate) * Engine.time_scale
	var limiter:int = 0
	while(accumulator >= 1.0):
		tick.emit()
		system_physics._tick()
		accumulator -= 1.0
		limiter += 1
		if(limiter > 10): 
			accumulator = 0.0
			break
