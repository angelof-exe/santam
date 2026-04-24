extends Node

const SAVE_PATH = "user://savegame.json"
const SAVE_VERSION = 1

const DEFAULT_MAX_HP: int = 20
const DEFAULT_ATK: int = 5

var party: Array = []
var inventory: Dictionary = {}
var flags: Dictionary = {}

var player_hp: int = DEFAULT_MAX_HP
var player_max_hp: int = DEFAULT_MAX_HP
var player_atk: int = DEFAULT_ATK

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
	player_hp = data.get("player_hp", DEFAULT_MAX_HP)
	player_max_hp = data.get("player_max_hp", DEFAULT_MAX_HP)
	player_atk = data.get("player_atk", DEFAULT_ATK)
	print("[GameState] save auto-loaded: hp=%d flags=%d items=%d" % [player_hp, flags.size(), inventory.size()])

func save_game() -> bool:
	var data := {
		"version": SAVE_VERSION,
		"flags": flags,
		"inventory": inventory,
		"party": party,
		"player_hp": player_hp,
		"player_max_hp": player_max_hp,
		"player_atk": player_atk,
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

func reset_for_new_game() -> void:
	flags.clear()
	inventory.clear()
	party.clear()
	player_max_hp = DEFAULT_MAX_HP
	player_hp = player_max_hp
	player_atk = DEFAULT_ATK
	delete_save()

# --- Player stats ---

func heal_player(amount: int = -1) -> void:
	if amount < 0:
		player_hp = player_max_hp
	else:
		player_hp = min(player_max_hp, player_hp + amount)

func damage_player(amount: int) -> void:
	player_hp = max(0, player_hp - amount)

func is_player_alive() -> bool:
	return player_hp > 0

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
