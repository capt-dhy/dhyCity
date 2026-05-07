extends Command
class_name SpeedCommand

func execute(args: Array, world_interface: Node) -> void:
	if args.size() < 1:
		print("SpeedCommand: Missing speed value")
		return

	var new_speed = args[0].to_float()
	world_interface.set_player_speed(new_speed)
