extends Node2D

@onready var timer: RichTextLabel = $timer #literally just the richlabeltext

var time : float


func _process(_delta: float) -> void:
	testEsc()
	timer.text = str(snapped(time, 0.10)) # this makes names easier

func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		timer.paused = true
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		timer.paused = false


func Timer(start_time: float): # making a new function for timer countdown!
	# we want the timer to go down, and when it reaches 0 it transitions 
	# to the next scene!
	testEsc()
	
	time = start_time
	
	while time > 0.0: # run if timer hasnt reached 0
		await wait(0.10)
		time = time - 0.10
	
	#when timer reaches 0
	return
	
func wait(seconds: float) -> void: # write this simple function out for wait!
	await get_tree().create_timer(seconds).timeout # makes u wait
