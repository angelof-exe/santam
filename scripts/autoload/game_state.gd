extends Node

const SAVE_PATH = "user://savegame.json"
const SAVE_VERSION = 1

var party: Array = []
var inventory: Dictionary = {}
var flags: Dictionary = {}

func _ready() -> void:
	print("[GameState] ready")
	_auto_load()

func _auto_load() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		return
	var content := file.get_as_text()
	file.close()
	var json := JSON.new()
	var err := json.parse(content)
	if err != OK:
		push_warning("[GameState] save corrupted: %s" % json.get_error_message())
		return
	var data = json.data
	if typeof(data) != TYPE_DICTIONARY:
		return
	if data.get("version", 0) != SAVE_VERSION:
		push_warning("[GameState] save version mismatch, ignored")
		return
	flags = data.get("flags", {})
	inventory = data.get("inventory", {})
	party = data.get("party", [])
	print("[GameState] save auto-loaded: flags=%d items=%d" % [flags.size(), inventory.size()])

func save_game() -> bool:
	var data := {
		"version": SAVE_VERSION,
		"flags": flags,
		"inventory": inventory,
		"party": party,
	}
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_warning("[GameState] cannot open save for write")
		return false
	file.store_string(JSON.stringify(data))
	file.close()
	print("[GameState] saved")
	return true

func has_save() -> bool:
	return FileAccess.file_exists(SAVE_PATH)

func delete_save() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var dir := DirAccess.open("user://")
	if dir:
		dir.remove(SAVE_PATH.get_file())

# --- Flags ---

func set_flag(key: String, value: bool = true) -> void:
	flags[key] = value

func has_flag(key: String) -> bool:
	return flags.get(key, false)

func unset_flag(key: String) -> void:
	flags.erase(key)

# --- Inventory ---

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
