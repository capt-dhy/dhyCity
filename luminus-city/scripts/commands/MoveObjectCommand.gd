extends Command
class_name MoveObjectCommand

func execute(args: Array, world_interface: Node) -> void:
	if args.size() < 4:
		print("MoveObjectCommand: Missing object name or coordinates")
		return

	var object_name = args[0]
	var x = args[1].to_float()
	var y = args[2].to_float()
	var z = args[3].to_float()

	world_interface.move_object(object_name, Vector3(x, y, z))
