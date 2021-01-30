extends Node2D
var score = 0
onready var shake_camera = $ShakeCamera2D
onready var gui = $GUI

func _on_Sock_matched():
	shake_camera.add_trauma(0.3)
	score += 100
	gui.set_score(score)

func _on_Sock_dried():
	shake_camera.add_trauma(0.2)
	score += 10
	gui.set_score(score)
