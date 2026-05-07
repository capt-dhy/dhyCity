extends Node
class_name ExecutionEngine

@onready var registry = CommandRegistry.new()
@onready var parser = CommandParser.new()
@onready var world_interface = get_node("/root/MainWorld") # Adjust this path as needed

func execute_input(input: String) -> void:
	print("ExecutionEngine: Processing input: ", input)
	var parsed_data = parser.parse(input)
	if parsed_data.is_empty():
		return

	var command_name = parsed_data["command"]
	var args = parsed_data["args"]

	var command = registry.get_command(command_name)
	if command:
		print("ExecutionEngine: Executing command: ", command_name, " with args: ", args)
		command.execute(args, world_interface)
	else:
		print("ExecutionEngine: Unknown command: ", command_name)
