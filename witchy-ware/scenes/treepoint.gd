extends Node2D

@onready var player: CharacterBody2D = $"../Player"
@onready var self_area = $Area2D
@onready var player_area = $"../Player/Area2D"

# make a signal
signal tree

func _process(_delta: float) -> void: # this runs EVERY FRAME! 
	
	if player_area.overlaps_area(self_area): # checks if overlapping
		if self.visible:
			emit_signal("tree") #signal broadcast
			self.hide() #removed from player sight; collected
