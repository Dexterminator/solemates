extends "res://StateMachine/state.gd"

var speed = 1000
var direction
onready var timer = $Timer

func enter(data):
	direction = data["direction"]
	timer.start()

func update(delta):
	var velocity = direction * speed * delta
	owner.move_and_collide(Vector2(velocity, 0))

func _on_Timer_timeout():
	emit_signal("transition", "default", null)

func exit():
	timer.stop()
