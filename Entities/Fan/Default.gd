extends "res://StateMachine/state.gd"

var speed = 300
var max_force = 400
onready var max_sock_dist = 400

func update(delta):
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	var velocity = direction * speed * delta
	owner.move_and_collide(Vector2(velocity, 0))

	var aim_direction = Input.get_action_strength("aim_right") - Input.get_action_strength("aim_left")
	owner.fan.rotation = aim_direction

	if Input.is_action_pressed("fan"):
		for body in owner.fan_hitbox.get_overlapping_bodies():
			if body.is_in_group("socks"):
				var dist = owner.fan_hitbox.get_parent().global_position.y - body.global_position.y
				var force = max_force - max_force * (dist / max_sock_dist)
				body.dry(Vector2.UP.rotated(owner.fan_hitbox.get_parent().rotation) * force)
		owner.fan_paricles.set_emitting(true)
		owner.fan_paricles.set_visible(true)
		owner.eyes.set_animation("fanning")
		owner.mouth.set_animation("fanning")
		if not owner.sfx.is_playing():
			owner.sfx.play()
		speed = 100
	elif Input.is_action_just_released("fan"):
		owner.sfx.stop()
		speed = 300
		for body in owner.fan_hitbox.get_overlapping_bodies():
			if body.is_in_group("socks"):
				body.stop_drying()
	else:
		owner.fan_paricles.set_emitting(false)
		owner.fan_paricles.set_visible(false)
		owner.eyes.set_animation("default")
		owner.mouth.set_animation("default")
