extends RefCounted
class_name SpawnCommand

func execute(args: Array, world: WorldInterface) -> void:
	if args.size() < 1:
		print("SpawnCommand Error: Missing object type.")
		return

	var object_type = args[0]
	var pos = Vector3.ZERO

	if args.size() >= 4:
		pos.x = float(args[1])
		pos.y = float(args[2])
		pos.z = float(args[3])

	var res_path = ""
	match object_type:
		"cube":
			res_path = "res://Models/cube.tscn" # Placeholder
		"sphere":
			res_path = "res://Models/sphere.tscn" # Placeholder
		_:
			print("Unknown object type: ", object_type)
			return

	world.spawn_object(res_path, pos)
