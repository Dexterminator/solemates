extends KinematicBody2D

var speed = 1000

func _physics_process(delta):
	var direction := Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT
	var velocity = direction * 2500 * delta
	move_and_collide(velocity)
