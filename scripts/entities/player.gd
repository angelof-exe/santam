extends CharacterBody2D
class_name Player

@export var speed: float = 80.0

func _physics_process(_delta: float) -> void:
	var h := Input.get_axis("ui_left", "ui_right")
	velocity.x = h * speed
	velocity.y = 0
	move_and_slide()
