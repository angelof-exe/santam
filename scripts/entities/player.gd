extends CharacterBody2D
class_name Player

@export var speed: float = 80.0

@onready var visual: Node2D = $Visual

func _physics_process(_delta: float) -> void:
	if DialogueManager.is_active():
		velocity = Vector2.ZERO
		move_and_slide()
		return
	var h := Input.get_axis("ui_left", "ui_right")
	velocity.x = h * speed
	velocity.y = 0
	move_and_slide()
	if h > 0.01:
		visual.scale.x = 1
	elif h < -0.01:
		visual.scale.x = -1
