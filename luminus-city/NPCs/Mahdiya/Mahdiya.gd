extends CharacterBody3D

@export var name_label: String = "Mahdiya"

func _ready() -> void:
	print("NPC ", name_label, " is ready.")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= 9.8 * delta
	move_and_slide()
