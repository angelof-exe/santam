extends Node2D

@onready var menu_button: Button = $HUD/MenuButton

func _ready() -> void:
	menu_button.pressed.connect(_on_menu)
	menu_button.grab_focus()

func _on_menu() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
