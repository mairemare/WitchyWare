extends Node2D

@onready var magic: CharacterBody2D = $"../magic"
@onready var magic_area: Area2D = $"../magic_ball/Area2D"
@onready var dead_area: Area2D = $Area2D

# make a signal
signal hit

func _process(_delta: float) -> void: # this runs EVERY FRAME! :

	if dead_area.overlaps_area(magic_area): # checks if overlapping
		emit_signal("hit") #signal broadcast
		
