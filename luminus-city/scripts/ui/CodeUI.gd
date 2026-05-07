extends CanvasLayer

@onready var line_edit: LineEdit = $Panel/LineEdit
@onready var run_button: Button = $Panel/Button
@onready var interaction_prompt: Label = $InteractionPrompt

var registry: CommandRegistry
var execution_engine: ExecutionEngine
var world_interface: WorldInterface

func _ready() -> void:
	# Initialize system components
	registry = CommandRegistry.new()
	world_interface = WorldInterface.new()
	add_child(world_interface) # Needs to be in tree for get_tree() calls

	execution_engine = ExecutionEngine.new(registry, world_interface)

	# Register commands
	registry.register_command("spawn", SpawnCommand.new())
	registry.register_command("teleport", TeleportCommand.new())
	registry.register_command("set_speed", SpeedCommand.new())
	registry.register_command("time", TimeCommand.new())

	# Connect signals
	run_button.pressed.connect(_on_run_pressed)
	line_edit.text_submitted.connect(_on_text_submitted)

	# Hide by default
	visible = false
	interaction_prompt.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_code_ui"):
		toggle_ui()

func toggle_ui() -> void:
	visible = !visible
	if visible:
		line_edit.grab_focus()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_run_pressed() -> void:
	_execute()

func _on_text_submitted(_text: String) -> void:
	_execute()

func _execute() -> void:
	var input_text = line_edit.text
	if input_text.is_empty():
		return

	var parsed = CommandParser.parse(input_text)
	execution_engine.execute_command(parsed)

	line_edit.clear()
	toggle_ui()

func show_interaction_prompt(text: String) -> void:
	interaction_prompt.text = text
	interaction_prompt.visible = true

func hide_interaction_prompt() -> void:
	interaction_prompt.visible = false
