extends Node2D

@onready var magic: CharacterBody2D = $"../magic"
@onready var hit_area = $Area2D
@onready var magic_area = $"../magic/CollisionShape2D"

# make a signal
signal hit

func _process(_delta: float) -> void: # this runs EVERY FRAME! 
	
	if magic_area.overlaps_area(hit_area): # checks if overlapping
		if self.visible:
			emit_signal("hit") #signal broadcast
			self.hide() #removed from player sight; collected
