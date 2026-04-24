extends Node

const DIALOGUE_BOX_SCENE = preload("res://scenes/ui/dialogue_box.tscn")

var _dialogue_box: CanvasLayer
var _lines: Array = []
var _index: int = 0
var _active: bool = false

func _ready() -> void:
	_dialogue_box = DIALOGUE_BOX_SCENE.instantiate()
	get_tree().root.call_deferred("add_child", _dialogue_box)
	_dialogue_box.visible = false
	print("[DialogueManager] ready")

func is_active() -> bool:
	return _active

func show_dialogue(speaker: String, lines: Array) -> void:
	if lines.is_empty():
		return
	_lines = lines
	_index = 0
	_active = true
	_dialogue_box.set_speaker(speaker)
	_dialogue_box.set_text(lines[0])
	_dialogue_box.visible = true

func _unhandled_input(event: InputEvent) -> void:
	if not _active:
		return
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_cancel"):
		_advance()
		get_viewport().set_input_as_handled()

func _advance() -> void:
	_index += 1
	if _index >= _lines.size():
		_end_dialogue()
	else:
		_dialogue_box.set_text(_lines[_index])

func _end_dialogue() -> void:
	_active = false
	_lines = []
	_index = 0
	_dialogue_box.visible = false
