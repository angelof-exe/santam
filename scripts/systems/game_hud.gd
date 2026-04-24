extends CanvasLayer

const HIDDEN_SCENES = [
	"res://scenes/ui/main_menu.tscn",
	"res://scenes/ui/game_over.tscn",
	"res://scenes/combat/battle.tscn",
]

@onready var hp_label: Label = $Panel/HPLabel

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta: float) -> void:
	_update_visibility()
	_update_hp()

func _update_visibility() -> void:
	var current := get_tree().current_scene
	if current == null:
		visible = false
		return
	visible = not (current.scene_file_path in HIDDEN_SCENES)

func _update_hp() -> void:
	hp_label.text = "HP  %d/%d" % [GameState.player_hp, GameState.player_max_hp]
