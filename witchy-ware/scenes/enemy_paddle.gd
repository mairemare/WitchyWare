extends CharacterBody2D


var magic : CharacterBody2D

func _ready() -> void:
	magic = get_parent().get_node("magic")
	
func _physics_process(_float) -> void:
	global_position.y = magic.global_position.y
	
	
