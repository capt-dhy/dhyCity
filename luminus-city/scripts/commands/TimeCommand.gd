extends Command
class_name TimeCommand

func execute(args: Array, world_interface: Node) -> void:
	if args.size() < 1:
		print("TimeCommand: Missing time value")
		return

	var time_val = args[0].to_float()
	world_interface.set_world_time(time_val)
