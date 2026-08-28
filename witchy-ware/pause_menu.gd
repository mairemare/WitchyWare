extends CanvasLayer


# Called when the node enters the scene tree for the first time.

func _on_resume_pressed() -> void:
	hide()
	get_tree().paused = false

func testEsc():
	if Input.is_action_just_pressed("esc") == true:
		get_tree().paused = true
		show()
	elif Input.is_action_just_pressed("esc") == false:
		hide()
		get_tree().paused = false
		
func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/timerscreen.tscn")
	Global.minigames_done = 0
	Global.lives = 5
	
func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
	Global.minigames_done = 0
	Global.lives = 5
