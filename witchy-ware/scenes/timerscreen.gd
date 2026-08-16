extends Node2D

@onready var paw_box: HBoxContainer = $"paw box"
@onready var paw_1: TextureRect = $"paw box/paw1"
@onready var paw_2: TextureRect = $"paw box/paw2"
@onready var paw_3: TextureRect = $"paw box/paw3"
@onready var paw_4: TextureRect = $"paw box/paw4"
@onready var paw_5: TextureRect = $"paw box/paw5"
@onready var level: RichTextLabel = $level
@onready var timer: RichTextLabel = $timer

var time

func _ready() -> void:
	await Timer(5.0)
		
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
			
func _process(_delta: float) -> void:
	match Global.lives:

		4:
			paw_5.hide()
		3:
			paw_5.hide()
			paw_4.hide()
		2:
			paw_5.hide()
			paw_4.hide()
			paw_3.hide()
		1:
			paw_5.hide()
			paw_4.hide()
			paw_3.hide()
			paw_2.hide()
		0:
			paw_box.hide()
	
	timer.text = str(time)
	level.text = "Level " + str(Global.minigames_done)

func Timer(start_time: float):
	time = start_time 
	while time > 0.0: 
		await wait(0.1) 
		time -= 0.1 
	return

func wait(seconds: float) -> void: 
	await get_tree().create_timer(seconds).timeout 
