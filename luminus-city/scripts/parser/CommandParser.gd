extends Node
class_name CommandParser

## Parses a raw string input into a structured command dictionary.
## Input: "spawn cube 5 2 3"
## Output: { "command": "spawn", "args": ["cube", "5", "2", "3"] }
static func parse(input: String) -> Dictionary:
	var parts = input.strip_edges().split(" ", false)

	if parts.size() == 0:
		return { "command": "", "args": [] }

	var command_name = parts[0].to_lower()
	var args = []

	if parts.size() > 1:
		for i in range(1, parts.size()):
			args.append(parts[i])

	return {
		"command": command_name,
		"args": args
	}
