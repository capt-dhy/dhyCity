extends Command
class_name SpawnCommand

func execute(args: Array, world_interface: Node) -> void:
	if args.size() < 1:
		print("SpawnCommand: Missing object name")
		return

	var object_name = args[0]
	var x = 0.0
	var y = 0.0
	var z = 0.0

	if args.size() >= 4:
		x = args[1].to_float()
		y = args[2].to_float()
		z = args[3].to_float()

	world_interface.spawn_object(object_name, Vector3(x, y, z))
