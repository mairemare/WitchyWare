extends Control

func _on_again_pressed() -> void:
	Global.minigames_done = 0
	Global.lives = 5
	get_tree().change_scene_to_file("res://scenes/timerscreen.tscn")
	


func _on_back_pressed() -> void:
	Global.minigames_done = 0
	Global.lives = 5
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
