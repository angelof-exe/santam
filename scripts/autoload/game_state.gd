extends Node

var party: Array = []
var inventory: Dictionary = {}
var flags: Dictionary = {}

func _ready() -> void:
	print("[GameState] ready")

func set_flag(key: String, value: bool = true) -> void:
	flags[key] = value

func has_flag(key: String) -> bool:
	return flags.get(key, false)

func unset_flag(key: String) -> void:
	flags.erase(key)
