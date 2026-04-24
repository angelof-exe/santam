extends Area2D
class_name ItemPickup

@export var item_id: String = "ingranaggio"
@export var item_display_name: String = "un Ingranaggio"
@export var item_count: int = 1
@export var requires_flag: String = ""
@export var pickup_flag: String = ""

@onready var prompt_label: Label = $PromptLabel

var _player_nearby: bool = false

func _ready() -> void:
	if requires_flag != "" and not GameState.has_flag(requires_flag):
		queue_free()
		return
	if pickup_flag != "" and GameState.has_flag(pickup_flag):
		queue_free()
		return
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
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
		_pickup()
		get_viewport().set_input_as_handled()

func _pickup() -> void:
	if prompt_label:
		prompt_label.hide()
	GameState.add_item(item_id, item_count)
	if pickup_flag != "":
		GameState.set_flag(pickup_flag, true)
	var line := "Hai raccolto: %s" % item_display_name
	if item_count > 1:
		line = "Hai raccolto: %s (x%d)" % [item_display_name, item_count]
	DialogueManager.show_dialogue("", [line])
	queue_free()
