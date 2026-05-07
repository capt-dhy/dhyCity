extends Node3D

@onready var player: CharacterBody3D = $Player
@onready var sun: DirectionalLight3D = $DirectionalLight3D

func spawn_object(object_type: String, position: Vector3) -> void:
	print("World: Spawning ", object_type, " at ", position)
	var mesh_instance = MeshInstance3D.new()
	var mesh: Mesh

	match object_type.to_lower():
		"cube":
			mesh = BoxMesh.new()
		"sphere":
			mesh = SphereMesh.new()
		"capsule":
			mesh = CapsuleMesh.new()
		_:
			print("World: Unknown object type ", object_type)
			return

	mesh_instance.mesh = mesh
	add_child(mesh_instance)
	mesh_instance.global_position = position
	mesh_instance.name = object_type + "_" + str(Time.get_ticks_msec())

func teleport_player(position: Vector3) -> void:
	print("World: Teleporting player to ", position)
	player.global_position = position

func set_player_speed(speed: float) -> void:
	print("World: Setting player speed to ", speed)
	if player.has_method("set_movement_speed"):
		player.set_movement_speed(speed)

func set_world_time(time_val: float) -> void:
	print("World: Setting time to ", time_val)
	# Simple implementation: rotate the sun
	sun.rotation_degrees.x = time_val * 15.0 # Just a dummy mapping

func move_object(object_name: String, position: Vector3) -> void:
	print("World: Moving ", object_name, " to ", position)
	var obj = get_node_or_null(object_name)
	if obj and obj is Node3D:
		obj.global_position = position
	else:
		print("World: Object ", object_name, " not found or not a Node3D")
