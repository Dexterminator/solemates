extends KinematicBody2D

var speed = 1000
var max_force = 400
var drying = false
onready var max_sock_dist = 400
onready var fan = $Fan
onready var fan_hitbox = $Fan/Area2D
onready var fan_paricles = $Fan/Particles2D
onready var eyes = $Fan/Eyes
onready var mouth = $Fan/Mouth

func cube(x):
	return x
#	return 1 - pow(1 - x, 3);

func _physics_process(delta):
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	var velocity = direction * 500 * delta
	move_and_collide(Vector2(velocity, 0))

	var aim_direction = Input.get_action_strength("aim_right") - Input.get_action_strength("aim_left")
	fan.rotation = aim_direction

	if Input.is_action_pressed("fan"):
		for body in fan_hitbox.get_overlapping_bodies():
			if body.is_in_group("socks"):
				body.dry()
				var dist = fan_hitbox.get_parent().global_position.y - body.global_position.y
				var force = max_force - max_force * cube(dist / max_sock_dist)
				body.add_force(Vector2.ZERO, Vector2.UP.rotated(fan_hitbox.get_parent().rotation) * force)
		fan_paricles.set_emitting(true)
		eyes.set_animation("fanning")
		mouth.set_animation("fanning")
	elif Input.is_action_just_released("fan"):
		for body in fan_hitbox.get_overlapping_bodies():
			if body.is_in_group("socks"):
				body.stop_drying()
	else:
		fan_paricles.set_emitting(false)
		eyes.set_animation("default")
		mouth.set_animation("default")

func _on_Area2D_body_exited(body):
	if body.is_in_group("socks"):
		body.stop_drying()
