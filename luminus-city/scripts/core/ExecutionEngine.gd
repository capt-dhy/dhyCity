extends Node
class_name ExecutionEngine

var registry: CommandRegistry
var world_interface: WorldInterface

func _init(_registry: CommandRegistry, _world_interface: WorldInterface):
	registry = _registry
	world_interface = _world_interface

func execute_command(parsed_data: Dictionary) -> void:
	var command_name = parsed_data.get("command", "")
	var args = parsed_data.get("args", [])

	if command_name == "":
		return

	var command_obj = registry.get_command(command_name)
	if command_obj:
		print("Executing command: ", command_name, " with args: ", args)
		command_obj.execute(args, world_interface)
	else:
		print("Unknown command: ", command_name)
