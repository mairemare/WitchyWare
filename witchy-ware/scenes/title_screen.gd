extends Control


@onready var main_buttons: VBoxContainer = $"main buttons"
@onready var settings: Panel = $settings


func _ready() -> void:
	main_buttons.visible = true
	settings.visible = false


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_scene.tscn")


func _on_settings_pressed() -> void:
	main_buttons.visible = false
	settings.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	main_buttons.visible = true
	settings.visible = false
