extends CanvasLayer

@onready var continue_button: Button = $Overlay/Panel/Buttons/ContinueButton
@onready var save_button: Button = $Overlay/Panel/Buttons/SaveButton
@onready var menu_button: Button = $Overlay/Panel/Buttons/MenuButton
@onready var quit_button: Button = $Overlay/Panel/Buttons/QuitButton
@onready var status_label: Label = $Overlay/Panel/StatusLabel

var _open: bool = false

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false
	continue_button.pressed.connect(_on_continue)
	save_button.pressed.connect(_on_save)
	menu_button.pressed.connect(_on_menu)
	quit_button.pressed.connect(_on_quit)
	status_label.text = ""

func _unhandled_input(event: InputEvent) -> void:
	if DialogueManager.is_active():
		return
	if get_tree().paused and not _open:
		return
	if _is_on_main_menu():
		return
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_ESCAPE:
			toggle()
			get_viewport().set_input_as_handled()

func is_open() -> bool:
	return _open

func toggle() -> void:
	if _open:
		_close()
	else:
		_open_menu()

func _open_menu() -> void:
	status_label.text = ""
	_open = true
	visible = true
	get_tree().paused = true
	continue_button.grab_focus()

func _close() -> void:
	_open = false
	visible = false
	get_tree().paused = false

func _on_continue() -> void:
	_close()

func _on_save() -> void:
	var ok := GameState.save_game()
	status_label.text = "Salvato." if ok else "Errore di scrittura."

func _on_menu() -> void:
	_open = false
	visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func _on_quit() -> void:
	get_tree().quit()

func _is_on_main_menu() -> bool:
	var current := get_tree().current_scene
	if current == null:
		return false
	return current.scene_file_path == "res://scenes/ui/main_menu.tscn"
