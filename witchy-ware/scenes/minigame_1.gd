extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer
# ^^^ You dragged this in the scene by the way 

var potion_collected = 0 # just keeping track of garlic collected
var timer_end = false # boolean (true or false) stating whether the timer ended

func _ready() -> void:
	if Global.lives == 0:
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")
	
	await themed_timer.Timer(10.0) #accessing a function from this node
	#after this is compeleted...
	timer_end = true # now we're saying "oh ye you ran out of time"

func _process(_delta: float) -> void: # running every frame brochacho
	
	if potion_collected == 3: # the double equals is just an argument asking if it's the same, with "=" it'll give an error
		if Global.minigames_done > 3: # we access a global script and see how many minigames have been compeleted
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn") # change current play scene into another, but you make your own finish screen in a later challenge, dont worry abt this rn
		else:
			get_tree().change_scene_to_file("res://scenes/timerscreen.tscn") # go back to the intermission scene
	
	if timer_end: # if the timer does end...
		Global.minigames_done -=1 #go back a minigame
		Global.lives -= 1 # lose ur lives
		get_tree().change_scene_to_file("res://scenes/timerscreen.tscn") # back to intermission
		

func potion_collect() -> void:
	potion_collected = potion_collected +1
	return
