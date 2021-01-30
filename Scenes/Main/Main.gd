extends Node2D

onready var shake_camera = $ShakeCamera2D

func _on_Sock_matched():
	shake_camera.add_trauma(0.3)

func _on_Sock_dried():
	shake_camera.add_trauma(0.2)
