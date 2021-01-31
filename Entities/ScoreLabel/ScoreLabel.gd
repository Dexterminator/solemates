extends Node2D

onready var anim_player = $AnimationPlayer
onready var label = $Label
var alpha = 1

func set_text(text):
	label.set_text(text)

func _physics_process(delta):
	global_position.y -= 5
	alpha -= 0.01
	label.modulate = Color(1, 1, 1, alpha)

func _on_Timer_timeout():
	queue_free()
