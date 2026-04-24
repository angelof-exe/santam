extends Node2D
class_name Battle

enum State { PLAYER_MENU, PLAYER_ATTACK_ANIM, ENEMY_TURN, ENEMY_ATTACK_ANIM, VICTORY, DEFEAT, FLED }

@export var player_max_hp: int = 20
@export var player_atk: int = 5
@export var enemy_name: String = "Custode meccanico"
@export var enemy_max_hp: int = 10
@export var enemy_atk: int = 3
@export var victory_flag: String = "custode_sconfitto"
@export_file("*.tscn") var return_scene: String = "res://scenes/world/test_room.tscn"

var player_hp: int
var enemy_hp: int
var state: State = State.PLAYER_MENU

@onready var player_hp_label: Label = $HUD/PlayerHP
@onready var enemy_hp_label: Label = $HUD/EnemyHP
@onready var message_label: Label = $HUD/Message
@onready var attack_button: Button = $HUD/ActionMenu/AttackButton
@onready var flee_button: Button = $HUD/ActionMenu/FleeButton

func _ready() -> void:
	player_hp = player_max_hp
	enemy_hp = enemy_max_hp
	attack_button.pressed.connect(_on_attack)
	flee_button.pressed.connect(_on_flee)
	_update_hud()
	_show_message("%s ti blocca la strada!" % enemy_name)
	_set_state(State.PLAYER_MENU)
	attack_button.grab_focus()

func _update_hud() -> void:
	player_hp_label.text = "Turi   %d/%d" % [player_hp, player_max_hp]
	enemy_hp_label.text = "%s   %d/%d" % [enemy_name, enemy_hp, enemy_max_hp]

func _show_message(text: String) -> void:
	message_label.text = text

func _set_state(new_state: State) -> void:
	state = new_state
	var menu_visible := state == State.PLAYER_MENU
	attack_button.visible = menu_visible
	flee_button.visible = menu_visible
	if menu_visible:
		attack_button.grab_focus()

func _on_attack() -> void:
	if state != State.PLAYER_MENU:
		return
	_set_state(State.PLAYER_ATTACK_ANIM)
	var dmg := player_atk + randi_range(-1, 2)
	enemy_hp = max(0, enemy_hp - dmg)
	_update_hud()
	_show_message("Turi colpisce con la chiave inglese. %d danni." % dmg)
	await get_tree().create_timer(1.0).timeout
	if enemy_hp <= 0:
		_victory()
	else:
		_enemy_turn()

func _on_flee() -> void:
	if state != State.PLAYER_MENU:
		return
	_set_state(State.FLED)
	_show_message("Scappi nel buio.")
	await get_tree().create_timer(1.0).timeout
	_return_to_world()

func _enemy_turn() -> void:
	_set_state(State.ENEMY_TURN)
	_show_message("Il %s raccoglie il vapore..." % enemy_name)
	await get_tree().create_timer(0.8).timeout
	var dmg := enemy_atk + randi_range(-1, 2)
	player_hp = max(0, player_hp - dmg)
	_update_hud()
	_show_message("Il %s colpisce. %d danni." % [enemy_name, dmg])
	await get_tree().create_timer(1.0).timeout
	if player_hp <= 0:
		_defeat()
	else:
		_set_state(State.PLAYER_MENU)
		_show_message("Cosa fai?")

func _victory() -> void:
	_set_state(State.VICTORY)
	_show_message("Il %s cade, scricchiola, si ferma." % enemy_name)
	if victory_flag != "":
		GameState.set_flag(victory_flag, true)
	await get_tree().create_timer(1.8).timeout
	_return_to_world()

func _defeat() -> void:
	_set_state(State.DEFEAT)
	_show_message("Turi cade a terra. Il vapore lo avvolge.")
	await get_tree().create_timer(2.2).timeout
	_return_to_world()

func _return_to_world() -> void:
	if return_scene == "":
		return
	get_tree().change_scene_to_file(return_scene)
