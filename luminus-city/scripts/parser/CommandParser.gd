extends Node
class_name CommandParser

func parse(input: String) -> Dictionary:
	var parts = input.strip_edges().split(" ", false)
	if parts.size() == 0:
		return {}

	var command_name = parts[0].to_lower()
	var args = []
	for i in range(1, parts.size()):
		args.append(parts[i])

	return {
		"command": command_name,
		"args": args
	}
