extends Node
class_name WorldInterface

var player: CharacterBody3D
var main_world: Node3D

func _ready():
	# Try to find the player and main world in the scene tree
	player = get_tree().get_first_node_in_group("player")
	main_world = get_tree().root.get_child(0) # Assuming MainWorld is the root child

func get_player() -> CharacterBody3D:
	if not player:
		player = get_tree().get_first_node_in_group("player")
	return player

func get_main_world() -> Node3D:
	return main_world

func spawn_object(object_path: String, position: Vector3) -> void:
	var scene = load(object_path)
	if scene:
		var instance = scene.instantiate()
		main_world.add_child(instance)
		instance.global_position = position
		print("Spawned object: ", object_path, " at ", position)
	else:
		print("Failed to load object: ", object_path)
