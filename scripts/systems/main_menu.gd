extends Node2D

const FIRST_SCENE = "res://scenes/world/test_room.tscn"

@onready var new_game_button: Button = $HUD/MenuButtons/NewGameButton
@onready var continue_button: Button = $HUD/MenuButtons/ContinueButton
@onready var quit_button: Button = $HUD/MenuButtons/QuitButton

func _ready() -> void:
	new_game_button.pressed.connect(_on_new_game)
	continue_button.pressed.connect(_on_continue)
	quit_button.pressed.connect(_on_quit)
	continue_button.disabled = not GameState.has_save()
	if GameState.has_save():
		continue_button.grab_focus()
	else:
		new_game_button.grab_focus()

func _on_new_game() -> void:
	GameState.flags.clear()
	GameState.inventory.clear()
	GameState.party.clear()
	GameState.delete_save()
	get_tree().change_scene_to_file(FIRST_SCENE)

func _on_continue() -> void:
	get_tree().change_scene_to_file(FIRST_SCENE)

func _on_quit() -> void:
	get_tree().quit()
