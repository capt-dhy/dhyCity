extends CharacterBody3D

@export var speed: float = 2.0
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta: float) -> void:
	# Basic gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Simple idle movement could be added here

	move_and_slide()
