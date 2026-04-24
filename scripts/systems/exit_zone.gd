extends Area2D
class_name ExitZone

@export_file("*.tscn") var target_scene: String = ""
@export var trigger_action: String = "ui_up"

@onready var prompt_label: Label = $PromptLabel

var _player_inside: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	if prompt_label:
		prompt_label.hide()

func _on_body_entered(body: Node) -> void:
	if body is Player:
		_player_inside = true
		_update_prompt()

func _on_body_exited(body: Node) -> void:
	if body is Player:
		_player_inside = false
		_update_prompt()

func _update_prompt() -> void:
	if prompt_label == null:
		return
	prompt_label.visible = _player_inside and not DialogueManager.is_active()

func _unhandled_input(event: InputEvent) -> void:
	if not _player_inside:
		return
	if DialogueManager.is_active():
		return
	if event.is_action_pressed(trigger_action):
		_transition()

func _transition() -> void:
	if target_scene == "":
		push_warning("[ExitZone] target_scene not set")
		return
	get_tree().change_scene_to_file(target_scene)
