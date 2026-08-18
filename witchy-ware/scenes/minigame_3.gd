extends Node2D


@onready var themed_timer: Node2D = $themed_timer
@onready var player: CharacterBody2D = $Player
@onready var magic: RigidBody2D = $Magic



var score
var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(7.0)
	#after this is completed...
	timer_end = true 
	
	score = 0 #starts scoring
	$StartTimer.start()


func _process(_delta: float) -> void:
	if score == 7:
		if Global.minigames_done > 3:
			get_tree().change_scene_to_file("res://scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/timerscreen.tscn")
	
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -=1
		get_tree().change_scene_to_file("res://scenes/timerscreen.tscn")

#code for the minigame

func game_over(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	$ScoreTimer.stop()
	$MagicTimer.stop()
	

func _on_magic_timer_timeout() -> void:

	# Choose a random location on Path2D.
	var magic_spawn_location = $MagicPath/MagicSpawnLocation
	magic_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	magic.position = magic_spawn_location.position

	# Set the mob's direction perpendicular to the path direction.
	var direction = magic_spawn_location.rotation + PI / 2

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	magic.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	magic.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(magic)


func _on_score_timer_timeout() -> void:
	score += 1
	

func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
