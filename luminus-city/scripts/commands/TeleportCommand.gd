extends Command
class_name TeleportCommand

func execute(args: Array, world_interface: Node) -> void:
	if args.size() < 3:
		print("TeleportCommand: Missing coordinates")
		return

	var x = args[0].to_float()
	var y = args[1].to_float()
	var z = args[2].to_float()

	world_interface.teleport_player(Vector3(x, y, z))
