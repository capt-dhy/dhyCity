extends RefCounted
class_name TeleportCommand

func execute(args: Array, world: WorldInterface) -> void:
	if args.size() < 3:
		print("TeleportCommand Error: Missing coordinates (x y z).")
		return

	var player = world.get_player()
	if player:
		var pos = Vector3(float(args[0]), float(args[1]), float(args[2]))
		player.global_position = pos
		print("Teleported player to: ", pos)
	else:
		print("TeleportCommand Error: Player not found.")
