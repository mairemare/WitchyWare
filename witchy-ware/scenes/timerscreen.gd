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
			paw_box.hide() # just hides everything
	
	timer.text = str(time)
	level.text = "Level " + str(Global.minigames_done)

func Timer(start_time: float):
	time = start_time # make the timer, which is reflected through the timer text, start at your desired number
	while time > 0.0: # run if timer hasnt reached 0
		await wait(0.1) # asks script to wait on this function. the 'wait' name for the function does nothing here, as await is just telling the scrpit to wait for the function to complete before progressing
		time -= 0.1 # remove 0.1
		# progressively get the value smaller and smaller
	return

func wait(seconds: float) -> void: # write this simple function out for wait!
	await get_tree().create_timer(seconds).timeout # makes u wait, dw abt this being complex '''
