extends Area2D
class_name BattleTrigger

@export_file("*.tscn") var battle_scene: String = ""
@export var block_flag: String = ""

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if not body is Player:
		return
	if block_flag != "" and GameState.has_flag(block_flag):
		return
	if battle_scene == "":
		push_warning("[BattleTrigger] battle_scene not set")
		return
	get_tree().change_scene_to_file(battle_scene)
