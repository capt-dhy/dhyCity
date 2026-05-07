extends Node
class_name CommandRegistry

var commands: Dictionary = {}

func register_command(command_name: String, command_object: RefCounted) -> void:
	commands[command_name.to_lower()] = command_object
	print("Command registered: ", command_name)

func get_command(command_name: String) -> RefCounted:
	if commands.has(command_name.to_lower()):
		return commands[command_name.to_lower()]
	return null

func has_command(command_name: String) -> bool:
	return commands.has(command_name.to_lower())
