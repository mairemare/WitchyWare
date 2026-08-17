extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed_scale = 0.5
	play("floating")


func _on_animation_finished(_anim_name: StringName) -> void:
	play("floating")
