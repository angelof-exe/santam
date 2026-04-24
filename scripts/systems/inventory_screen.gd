extends CanvasLayer
class_name InventoryScreenScene

@onready var items_list: VBoxContainer = $Overlay/Panel/ItemsList

var _open: bool = false

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false

func _unhandled_input(event: InputEvent) -> void:
	if DialogueManager.is_active():
		return
	if get_tree().paused and not _open:
		return
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_TAB:
			toggle()
			get_viewport().set_input_as_handled()

func is_open() -> bool:
	return _open

func toggle() -> void:
	if _open:
		close()
	else:
		open()

func open() -> void:
	_rebuild_list()
	_open = true
	visible = true
	get_tree().paused = true

func close() -> void:
	_open = false
	visible = false
	get_tree().paused = false

func _rebuild_list() -> void:
	for child in items_list.get_children():
		child.queue_free()
	if GameState.inventory.is_empty():
		var empty_label := Label.new()
		empty_label.text = "(vuoto)"
		empty_label.add_theme_color_override("font_color", Color(0.6, 0.6, 0.6))
		items_list.add_child(empty_label)
		return
	for item_id in GameState.inventory.keys():
		var count: int = GameState.inventory[item_id]
		var line := Label.new()
		line.text = "%s   x%d" % [_display(item_id), count]
		items_list.add_child(line)

func _display(item_id: String) -> String:
	return item_id.capitalize()
