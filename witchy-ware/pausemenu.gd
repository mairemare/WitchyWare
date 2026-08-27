extends Control

func _ready() -> void:
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	hide()
	$AnimationPlayer.play_backwards("blur")
	
func pause():
	get_tree().paused = true
	show()
	$AnimationPlayer.play("blur")
	
func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()
		
func _on_resume_pressed() -> void:
	resume()


func _on_restart_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://scenes/timerscreen.tscn")
	Global.minigames_done = 0
	Global.lives = 5


func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
	Global.minigames_done = 0
	Global.lives = 5

func _process(_delta: float) -> void:
	testEsc()
