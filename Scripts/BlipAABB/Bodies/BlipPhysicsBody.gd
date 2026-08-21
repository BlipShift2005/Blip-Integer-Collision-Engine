@abstract
@tool
class_name BlipPhysicsBody2D extends Node2D

@export var fixed_position:Vector2i

func _notification(what:int)->void:
	match(what):
		NOTIFICATION_ENTER_TREE:
			pass
		NOTIFICATION_EXIT_TREE:
			pass
		NOTIFICATION_PHYSICS_PROCESS:
			if(Engine.is_editor_hint()):
				fixed_position = Vector2i(position.floor())

func _physics_process(_delta:float)->void: pass

func _validate_property(property:Dictionary)->void:
	if(property.name == "fixed_position"):
		property.usage |= PROPERTY_USAGE_READ_ONLY

func move_and_collide(motion:Vector2i)->void:
	pass
