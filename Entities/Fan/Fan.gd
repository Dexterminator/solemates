extends KinematicBody2D

var speed = 1000
onready var fan = $Fan

func _physics_process(delta):
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	var velocity = direction * 500 * delta
	move_and_collide(Vector2(velocity, 0))

	var aim_direction = Input.get_action_strength("aim_right") - Input.get_action_strength("aim_left")
	print(Input.get_joy_axis(0, 1))
	fan.rotation = aim_direction
