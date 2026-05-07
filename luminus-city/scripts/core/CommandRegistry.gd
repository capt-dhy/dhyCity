extends Node
class_name CommandRegistry

var commands = {}

func _init() -> void:
	commands["spawn"] = SpawnCommand.new()
	commands["teleport"] = TeleportCommand.new()
	commands["set_speed"] = SpeedCommand.new()
	commands["time"] = TimeCommand.new()
	commands["move_object"] = MoveObjectCommand.new()

func get_command(command_name: String) -> Command:
	if commands.has(command_name):
		return commands[command_name]
	return null
