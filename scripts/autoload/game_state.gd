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

func add_item(item_id: String, count: int = 1) -> void:
	inventory[item_id] = inventory.get(item_id, 0) + count

func get_item_count(item_id: String) -> int:
	return inventory.get(item_id, 0)

func remove_item(item_id: String, count: int = 1) -> bool:
	var current: int = inventory.get(item_id, 0)
	if current < count:
		return false
	inventory[item_id] = current - count
	if inventory[item_id] <= 0:
		inventory.erase(item_id)
	return true

func has_item(item_id: String) -> bool:
	return inventory.get(item_id, 0) > 0
