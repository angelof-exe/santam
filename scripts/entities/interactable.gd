extends StaticBody2D
class_name Interactable

@export var speaker_name: String = ""
@export_multiline var interaction_text: String = ""
@export var sets_flag: String = ""

@onready var prompt_label: Label = $PromptLabel
@onready var interact_area: Area2D = $InteractArea

var _player_nearby: bool = false

func _ready() -> void:
	interact_area.body_entered.connect(_on_body_entered)
	interact_area.body_exited.connect(_on_body_exited)
	if prompt_label:
		prompt_label.hide()

func _on_body_entered(body: Node) -> void:
	if body is Player:
		_player_nearby = true
		_update_prompt()

func _on_body_exited(body: Node) -> void:
	if body is Player:
		_player_nearby = false
		_update_prompt()

func _update_prompt() -> void:
	if prompt_label == null:
		return
	prompt_label.visible = _player_nearby and not DialogueManager.is_active()

func _unhandled_input(event: InputEvent) -> void:
	if not _player_nearby:
		return
	if DialogueManager.is_active():
		return
	if event.is_action_pressed("ui_accept"):
		_interact()
		get_viewport().set_input_as_handled()

func _interact() -> void:
	var lines: Array = []
	for raw in interaction_text.split("\n"):
		var line := (raw as String).strip_edges()
		if line != "":
			lines.append(line)
	if lines.is_empty():
		return
	if prompt_label:
		prompt_label.hide()
	DialogueManager.show_dialogue(speaker_name, lines)
	if sets_flag != "":
		GameState.set_flag(sets_flag, true)
