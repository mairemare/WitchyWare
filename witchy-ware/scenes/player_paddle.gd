extends CharacterBody2D

const SPEED := 800.0

func getYdir() -> float:
	return Input.get_action_strength("down") - Input.get_action_strength("up")

func _physics_process(_float) -> void:
	var dir :Vector2=Vector2(0, getYdir())
	velocity = dir * SPEED
	move_and_slide()
	
