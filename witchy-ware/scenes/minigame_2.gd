extends Node2D

@onready var themed_timer: Node2D = $themed_timer

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	if Global.lives == 0:
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")
		
	await themed_timer.Timer(7.0)
	#after this is completed...
	timer_end = true 


func _process(_delta: float) -> void:
	if buttons_pressed == 7:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timerscreen.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://scenes/timerscreen.tscn")
		
