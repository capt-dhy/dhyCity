extends CharacterBody3D

@export var speed: float = 2.0
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var interaction_area: Area3D = $InteractionArea
var player_in_range: bool = false
var code_ui: CanvasLayer

func _ready() -> void:
	interaction_area.body_entered.connect(_on_body_entered)
	interaction_area.body_exited.connect(_on_body_exited)

	# Find CodeUI in the scene
	code_ui = get_tree().root.find_child("CodeUI", true, false)

func _physics_process(delta: float) -> void:
	# Basic gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	move_and_slide()

func _input(event: InputEvent) -> void:
	if player_in_range and event.is_action_pressed("interact"):
		interact()

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_in_range = true
		if code_ui:
			code_ui.show_interaction_prompt("Press E to talk to Mahdiya")

func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		if code_ui:
			code_ui.hide_interaction_prompt()

func interact() -> void:
	print("Interacting with Mahdiya!")
	# Basic reaction: turn towards player
	var player = get_tree().get_first_node_in_group("player")
	if player:
		var look_at_pos = player.global_position
		look_at_pos.y = global_position.y
		look_at(look_at_pos, Vector3.UP)
		rotate_y(PI) # Adjust for mesh orientation if needed
