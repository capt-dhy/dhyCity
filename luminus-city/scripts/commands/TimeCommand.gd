extends RefCounted
class_name TimeCommand

func execute(args: Array, world: WorldInterface) -> void:
	if args.size() < 1:
		print("TimeCommand Error: Missing time state (day/night).")
		return

	var state = args[0].to_lower()
	var main_world = world.get_main_world()
	if not main_world:
		print("TimeCommand Error: MainWorld not found.")
		return

	var sun: DirectionalLight3D = main_world.get_node_or_null("DirectionalLight3D")
	if not sun:
		print("TimeCommand Error: DirectionalLight3D not found in MainWorld.")
		return

	match state:
		"day":
			sun.rotation_degrees = Vector3(-45, 45, 0)
			sun.light_energy = 1.0
			print("Set time to Day.")
		"night":
			sun.rotation_degrees = Vector3(180, 45, 0)
			sun.light_energy = 0.1
			print("Set time to Night.")
		"evening", "sunset":
			sun.rotation_degrees = Vector3(0, 45, 0)
			sun.light_energy = 0.6
			print("Set time to Evening.")
		_:
			print("Unknown time state: ", state)
