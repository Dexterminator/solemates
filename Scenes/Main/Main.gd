extends Node2D
var score = 0
var game_time = 60
onready var shake_camera = $ShakeCamera2D
onready var gui = $GUI

func _ready():
	gui.set_time(game_time)

func _on_Sock_matched():
	shake_camera.add_trauma(0.3)
	score += 100
	gui.set_score(score)

func _on_Sock_dried():
	shake_camera.add_trauma(0.2)
	score += 10
	gui.set_score(score)

func _physics_process(delta):
	pass

func _on_Ticker_timeout():
	game_time -= 1
	gui.set_time(game_time)
