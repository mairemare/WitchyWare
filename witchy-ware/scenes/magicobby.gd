extends AnimationPlayer

func _ready() -> void:
	play("magic")
	speed_scale = 1.0

func _on_animation_finished(_anim_name: StringName) -> void:
	play("magic")
