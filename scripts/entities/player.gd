extends CharacterBody2D
class_name Player

@export var speed: float = 80.0

func _physics_process(_delta: float) -> void:
	var input_vec := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_vec * speed
	move_and_slide()
