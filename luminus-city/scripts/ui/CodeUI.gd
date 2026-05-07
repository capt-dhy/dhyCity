extends CanvasLayer

@onready var input_panel: Panel = $Panel
@onready var line_edit: LineEdit = $Panel/LineEdit
@onready var submit_button: Button = $Panel/Button
@onready var execution_engine: ExecutionEngine = $ExecutionEngine

func _ready() -> void:
	input_panel.hide()
	line_edit.text_submitted.connect(_on_line_edit_text_submitted)
	submit_button.pressed.connect(_on_submit_pressed)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_focus_next"): # Using Tab or similar for controller button mapping later
		toggle_ui()

func toggle_ui() -> void:
	if input_panel.visible:
		input_panel.hide()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		input_panel.show()
		line_edit.grab_focus()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text.strip_edges() != "":
		execution_engine.execute_input(new_text)
		line_edit.clear()
		toggle_ui()

func _on_submit_pressed() -> void:
	_on_line_edit_text_submitted(line_edit.text)
