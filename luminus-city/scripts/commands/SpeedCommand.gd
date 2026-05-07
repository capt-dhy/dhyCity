extends RefCounted
class_name SpeedCommand

func execute(args: Array, world: WorldInterface) -> void:
	if args.size() < 1:
		print("SpeedCommand Error: Missing speed value.")
		return

	var player = world.get_player()
	if player:
		var new_speed = float(args[0])
		if player.has_method("set_speed"):
			player.set_speed(new_speed)
		else:
			# Direct property access if set_speed doesn't exist
			player.set("speed", new_speed)
		print("Set player speed to: ", new_speed)
	else:
		print("SpeedCommand Error: Player not found.")
